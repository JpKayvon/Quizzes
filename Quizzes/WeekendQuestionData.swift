//
//  WeekendQuestionData.swift
//  Quizzes
//
//  Created by MACUser on 2018/02/07.
//  Copyright © 2018 MACUser. All rights reserved.
//

import Foundation

struct WeekendQuestion {
    var text: String
    var answers: [WeekendAnswer]
    var number: WeekendQuestionNumber
}

enum WeekendQuestionNumber {
    case One, Two, Three, Four, Five
}


struct WeekendAnswer {
    var text: String
    var answer: WeekendHealthType
}

enum WeekendHealthType: Character {
    case healthy = "🤾‍♂️", quiteHealthy = "🏌🏻‍♂️", quiteUnhealthy = "🎟", unhealthy = "🎮"
    
    var definition: String {
        switch self {
        case .unhealthy:
            return "Fat Fuck!"
        case .quiteUnhealthy:
            return "Couch potato"
        case .quiteHealthy:
            return "You are quite healthy for your age."
        case .healthy:
            return "Fitness Freak!"
        }
    }
}
