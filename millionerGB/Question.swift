//
//  Question.swift
//  millionerGB
//
//  Created by Андрей Тихонов on 02/03/2019.
//  Copyright © 2019 Андрей Тихонов. All rights reserved.
//

import Foundation

enum numberAnswer: Int {
    case answerA = 0
    case answerB = 1
    case answerC = 2
    case answerD = 3
}

struct Question {
    let textQuestion: String
    let arrayAnswers: [String]
    let answer: numberAnswer
    
    init(textQuestion: String, arrayAnswers: [String], answer: numberAnswer)
    {
        self.textQuestion = textQuestion
        self.arrayAnswers = arrayAnswers
        self.answer = answer
    }
}
