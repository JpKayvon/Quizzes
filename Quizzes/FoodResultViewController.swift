//
//  FoodResultViewController.swift
//  Quizzes
//
//  Created by MACUser on 2018/02/07.
//  Copyright © 2018 MACUser. All rights reserved.
//

import UIKit

class FoodResultViewController: UIViewController {

    //MARK: Outlets for object labels
    
    @IBOutlet weak var foodResultAnswerLabel: UILabel!
    @IBOutlet weak var foodResultDefinitionLabel: UILabel!
    
    //MARK: Property to receive data from the question controller
    var foodResponses: [FoodAnswer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculateFoodHealthResult()
    }
    
    func calculateFoodHealthResult() {
        var frequencyOfFoodAnswers: [FoodHealthType: Int] = [:]
        
        let foodResponsesType = foodResponses.map {$0.answer}
        
        for response in foodResponsesType {
            frequencyOfFoodAnswers[response] = (frequencyOfFoodAnswers[response] ?? 0) + 1
        }
        
        let mostCommonFoodAnswer = frequencyOfFoodAnswers.sorted {$0.1 > $1.1}.first!.key
        
        foodResultAnswerLabel.text = "\(mostCommonFoodAnswer.rawValue)"
        foodResultDefinitionLabel.text = mostCommonFoodAnswer.definition
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
