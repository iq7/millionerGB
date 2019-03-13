//
//  Question.swift
//  millionerGB
//
//  Created by Андрей Тихонов on 02/03/2019.
//  Copyright © 2019 Андрей Тихонов. All rights reserved.
//

import Foundation

//TODO: разобраться с Codable
struct Question: Codable {
    let textQuestion: String
    let arrayAnswers: [String]
    let answer: Int //numberAnswer

    init(textQuestion: String = "", arrayAnswers: [String] = ["", "", "", ""], answer: Int = 0) {//numberAnswer = .answerA) {
        self.textQuestion = textQuestion
        self.arrayAnswers = arrayAnswers
        self.answer = answer
    }
}

