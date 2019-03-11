//
//  Question.swift
//  millionerGB
//
//  Created by Андрей Тихонов on 02/03/2019.
//  Copyright © 2019 Андрей Тихонов. All rights reserved.
//

import Foundation

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
