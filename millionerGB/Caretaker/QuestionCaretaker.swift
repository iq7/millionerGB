//
//  QuestionCaretaker.swift
//  millionerGB
//
//  Created by Андрей Тихонов on 13/03/2019.
//  Copyright © 2019 Андрей Тихонов. All rights reserved.
//

import Foundation

final class QuestionCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let questionKey = "questionKey"
    
    func saveQuestions(_ questionList: [Question]) throws {
        for question in questionList {
            if question.textQuestion == "" || question.answer < 0 || question.answer > 3 { continue }
            for answer in question.arrayAnswers {
                if answer == "" { continue }
            }
            let data = try self.encoder.encode(questionList)
            UserDefaults.standard.set(data, forKey: self.questionKey)
        }
//        let data = try self.encoder.encode([Question()])
//        UserDefaults.standard.set(data, forKey: self.questionKey)
    }
    
    func loadQuestion() throws -> [Question] {
        guard let data = UserDefaults.standard.data(forKey: self.questionKey) else { return [] }
        return try self.decoder.decode([Question].self, from: data)
    }
}
