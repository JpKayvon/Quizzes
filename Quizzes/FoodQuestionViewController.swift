//
//  FoodQuestionViewController.swift
//  Quizzes
//
//  Created by MACUser on 2018/02/07.
//  Copyright © 2018 MACUser. All rights reserved.
//

import UIKit

class FoodQuestionViewController: UIViewController {

    //MARK: Outlets for objects
    @IBOutlet weak var foodQuestionLabel: UILabel!
    
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
    
    
    @IBOutlet weak var foodProgressView: UIProgressView!
    
    
    //MARK: Actions for objects
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let foodCurrentAnswers = foodQuestions[foodQuestionIndex].answers
        
        switch sender {
        case singleButton1:
            foodAnswersChosen.append(foodCurrentAnswers[0])
        case singleButton2:
            foodAnswersChosen.append(foodCurrentAnswers[1])
        case singleButton3:
            foodAnswersChosen.append(foodCurrentAnswers[2])
        case singleButton4:
            foodAnswersChosen.append(foodCurrentAnswers[3])
        default: break
        }
        
        nextFoodQuestion()
    }
    
    func nextFoodQuestion() {
        foodQuestionIndex += 1
        
        if foodQuestionIndex < foodQuestions.count {
            updateFoodUI()
        } else {
            performSegue(withIdentifier: "FoodResultsSegue", sender: nil)
        }
    }
    
    
    
    var foodQuestionIndex = 0
    
    var foodAnswersChosen: [FoodAnswer] = []
    
    var foodQuestions: [FoodQuestion] = [
       
        FoodQuestion(text: "How often do you eat fruit and vegetables?",
                 answers: [
                    FoodAnswer(text: "Everyday", answer: .healthy),
                    FoodAnswer(text: "Most days", answer: .quiteHealthy),
                    FoodAnswer(text: "A few times a week", answer: .quiteUnhealthy),
                    FoodAnswer(text: "Almost never", answer: .unhealthy)
            ],
                 number: .One),
        
        FoodQuestion(text: "How often do you eat fast food?",
                 answers: [
                    FoodAnswer(text: "Never", answer: .healthy),
                    FoodAnswer(text: "Not very often", answer: .quiteHealthy),
                    FoodAnswer(text: "Quite often", answer: .quiteUnhealthy),
                    FoodAnswer(text: "All the time", answer: .unhealthy)
            ],
                 number: .Two),
        
        FoodQuestion(text: "Which do you drink most often?",
                 answers: [
                    FoodAnswer(text: "Water", answer: .healthy),
                    FoodAnswer(text: "Green tea", answer: .quiteHealthy),
                    FoodAnswer(text: "Fruit juice", answer: .quiteUnhealthy),
                    FoodAnswer(text: "Fizzy drinks", answer: .unhealthy)
            ],
                 number: .Three),
        
        FoodQuestion(text: "How often did you eat candy, cakes or doughnuts?",
                 answers: [
                    FoodAnswer(text: "Never", answer: .healthy),
                    FoodAnswer(text: "Not very often", answer: .quiteHealthy),
                    FoodAnswer(text: "Quite often", answer: .quiteUnhealthy),
                    FoodAnswer(text: "All the time", answer: .unhealthy)
            ],
                 number: .Four),
        
        FoodQuestion(text: "Which did you eat most often?",
                 answers: [
                    FoodAnswer(text: "Fish or tofu", answer: .healthy),
                    FoodAnswer(text: "Chicken", answer: .quiteHealthy),
                    FoodAnswer(text: "Red meat", answer: .quiteUnhealthy),
                    FoodAnswer(text: "Bread or dairy products", answer: .unhealthy)
            ],
                 number: .Five)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFoodUI()

        // Do any additional setup after loading the view.
    }
    
    func updateFoodUI() {
        
        let currentFoodQuestion = foodQuestions[foodQuestionIndex]
        let currentFoodAnswer = currentFoodQuestion.answers
        let totalFoodProgress = Float(foodQuestionIndex) / Float(foodQuestions.count)
        
        
        navigationItem.title = "Question #\(foodQuestionIndex+1)"
        foodQuestionLabel.text = currentFoodQuestion.text
        foodProgressView.setProgress(totalFoodProgress, animated: true)
        
        func updateSingleStack(using answers: [FoodAnswer]) {
            singleButton1.setTitle(answers[0].text, for: .normal)
            singleButton2.setTitle(answers[1].text, for: .normal)
            singleButton3.setTitle(answers[2].text, for: .normal)
            singleButton4.setTitle(answers[3].text, for: .normal)
        }
  
        switch currentFoodQuestion.number {
        case .One:
            updateSingleStack(using: currentFoodAnswer)
        case .Two:
            updateSingleStack(using: currentFoodAnswer)
        case .Three:
            updateSingleStack(using: currentFoodAnswer)
        case .Four:
            updateSingleStack(using: currentFoodAnswer)
        case .Five:
            updateSingleStack(using: currentFoodAnswer)
        }
        
    }
    
    //MARK: Segue to pass data to results controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FoodResultsSegue"{
            let foodResultsViewController = segue.destination as! FoodResultViewController
            foodResultsViewController.foodResponses = foodAnswersChosen
        }
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
