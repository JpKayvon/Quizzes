//
//  WeekendResultViewController.swift
//  Quizzes
//
//  Created by MACUser on 2018/02/07.
//  Copyright © 2018 MACUser. All rights reserved.
//

import UIKit

class WeekendResultViewController: UIViewController {

    //MARK: Outlets for object labels
    
    @IBOutlet weak var weekendResultAnswerLabel: UILabel!
    @IBOutlet weak var weekendResultDefinitionLabel: UILabel!
    
    
    //MARK: Property to receive data from questions controller
    var weekendResponses: [WeekendAnswer]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculateWeekendHealthResult()
    }
    
    func calculateWeekendHealthResult() {
        var frequencyOfWeekendAnswers: [WeekendHealthType: Int] = [:]
        
        let weekendResponsesType = weekendResponses.map {$0.answer}
        
        for response in weekendResponsesType {
            frequencyOfWeekendAnswers[response] = (frequencyOfWeekendAnswers[response] ?? 0) + 1
        }
        
        let mostCommonWeekendAnswer = frequencyOfWeekendAnswers.sorted { $0.1 > $1.1 }.first!.key
        
        weekendResultAnswerLabel.text = "\(mostCommonWeekendAnswer.rawValue)"
        weekendResultDefinitionLabel.text = mostCommonWeekendAnswer.definition
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
