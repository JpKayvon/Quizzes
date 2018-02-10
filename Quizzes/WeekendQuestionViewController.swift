//
//  WeekendQuestionViewController.swift
//  Quizzes
//
//  Created by MACUser on 2018/02/07.
//  Copyright © 2018 MACUser. All rights reserved.
//

import UIKit

class WeekendQuestionViewController: UIViewController {
    
    //MARK: Outlets for objects
    @IBOutlet weak var weekendQuestionLabel: UILabel!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var multiLabel1: UILabel!
    @IBOutlet weak var multiLabel2: UILabel!
    @IBOutlet weak var multiLabel3: UILabel!
    @IBOutlet weak var multiLabel4: UILabel!
    @IBOutlet weak var multiSwitch1: UISwitch!
    @IBOutlet weak var multiSwitch2: UISwitch!
    @IBOutlet weak var multiSwitch3: UISwitch!
    @IBOutlet weak var multiSwitch4: UISwitch!
    
    @IBOutlet weak var weekendProgressView: UIProgressView!
    
    //MARK: Actions for objects
    
    @IBAction func multipleAnswerButtonPressed() {
        let weekendCurrentAnswers = weekendQuestions[weekendQuestionIndex].answers
        
        if multiSwitch1.isOn {
            weekendAnswersChosen.append(weekendCurrentAnswers[0])
        }
        if multiSwitch2.isOn {
            weekendAnswersChosen.append(weekendCurrentAnswers[1])
        }
        if multiSwitch3.isOn {
            weekendAnswersChosen.append(weekendCurrentAnswers[2])
        }
        if multiSwitch4.isOn {
            weekendAnswersChosen.append(weekendCurrentAnswers[3])
        }
        nextWeekendQuestion()
    }
    
    func nextWeekendQuestion() {
        weekendQuestionIndex += 1
        
        if weekendQuestionIndex < weekendQuestions.count {
            updateWeekendUI()
        } else {
            performSegue(withIdentifier: "WeekendResultsSegue", sender: nil)
        }
    }
    
    
    
    var weekendQuestionIndex = 0
    
    var weekendAnswersChosen: [WeekendAnswer] = []
    
    var weekendQuestions: [WeekendQuestion] = [
        WeekendQuestion(text: "How often do you exercise?",
                 answers: [
                    WeekendAnswer(text: "Everyday", answer: .healthy),
                    WeekendAnswer(text: "Most days", answer: .quiteHealthy),
                    WeekendAnswer(text: "A few times a week", answer: .quiteUnhealthy),
                    WeekendAnswer(text: "Almost never", answer: .unhealthy)
            ],
                 number: .One),
        
        WeekendQuestion(text: "Which do you usually do the most?",
                 answers: [
                    WeekendAnswer(text: "Sport", answer: .healthy),
                    WeekendAnswer(text: "Meeting friends / Shopping", answer: .quiteHealthy),
                    WeekendAnswer(text: "Studying / Sleeping", answer: .quiteUnhealthy),
                    WeekendAnswer(text: "Playing video games", answer: .unhealthy)
            ],
                 number: .Two),
        
        WeekendQuestion(text: "How much time do you sleep every night?",
                 answers: [
                    WeekendAnswer(text: "7-8 hours", answer: .healthy),
                    WeekendAnswer(text: "More than 8 hours", answer: .quiteHealthy),
                    WeekendAnswer(text: "6-7 hours", answer: .quiteUnhealthy),
                    WeekendAnswer(text: "Less than 6 hours", answer: .unhealthy)
            ],
                 number: .Three),
        
        WeekendQuestion(text: "How often are you sick?",
                 answers: [
                    WeekendAnswer(text: "Never", answer: .healthy),
                    WeekendAnswer(text: "A few times a year", answer: .quiteHealthy),
                    WeekendAnswer(text: "Every other month", answer: .quiteUnhealthy),
                    WeekendAnswer(text: "Most of the time", answer: .unhealthy)
            ],
                 number: .Four),
        
        WeekendQuestion(text: "How much time did you feel relaxed?",
                 answers: [
                    WeekendAnswer(text: "All the time", answer: .healthy),
                    WeekendAnswer(text: "Most of the time", answer: .quiteHealthy),
                    WeekendAnswer(text: "Sometimes", answer: .quiteUnhealthy),
                    WeekendAnswer(text: "Almost never", answer: .unhealthy)
            ],
                 number: .Five),
        ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateWeekendUI()

    }
    
    func updateWeekendUI() {
        
        let currentWeekendQuestion = weekendQuestions[weekendQuestionIndex]
        let currentWeekendAnswer = currentWeekendQuestion.answers
        let totalWeekendProgress = Float(weekendQuestionIndex) / Float(weekendQuestions.count)
        
        
        navigationItem.title = "Question #\(weekendQuestionIndex+1)"
        weekendQuestionLabel.text = currentWeekendQuestion.text
    weekendProgressView.setProgress(totalWeekendProgress, animated: true)
        
        func updateMultipleStack(using answers: [WeekendAnswer]) {
            multiSwitch1.isOn = false
            multiSwitch2.isOn = false
            multiSwitch3.isOn = false
            multiSwitch4.isOn = false
            multiLabel1.text = answers[0].text
            multiLabel2.text = answers[1].text
            multiLabel3.text = answers[2].text
            multiLabel4.text = answers[3].text
        }
        
        switch currentWeekendQuestion.number {
        case .One:
            updateMultipleStack(using: currentWeekendAnswer)
        case .Two:
            updateMultipleStack(using: currentWeekendAnswer)
        case .Three:
            updateMultipleStack(using: currentWeekendAnswer)
        case .Four:
            updateMultipleStack(using: currentWeekendAnswer)
        case .Five:
            updateMultipleStack(using: currentWeekendAnswer)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "WeekendResultsSegue" {
            let weekendResultsViewController = segue.destination as! WeekendResultViewController
            weekendResultsViewController.weekendResponses = weekendAnswersChosen
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
