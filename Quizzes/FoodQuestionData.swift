//
//  FoodQuestionData.swift
//  Quizzes
//
//  Created by MACUser on 2018/02/07.
//  Copyright © 2018 MACUser. All rights reserved.
//

import Foundation

struct FoodQuestion {
    var text: String
    var answers: [FoodAnswer]
    var number: FoodQuestionNumber
}

enum FoodQuestionNumber {
    case One, Two, Three, Four, Five
}

struct FoodAnswer {
    var text: String
    var answer: FoodHealthType
}

enum FoodHealthType: Character {
    case healthy = "🍎", quiteHealthy = "🍣", quiteUnhealthy = "🍝", unhealthy = "🍟"
    
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
