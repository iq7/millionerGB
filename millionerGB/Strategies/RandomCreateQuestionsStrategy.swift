//
//  RandomCreateQuestionsStrategy.swift
//  millionerGB
//
//  Created by Андрей Тихонов on 05/03/2019.
//  Copyright © 2019 Андрей Тихонов. All rights reserved.
//

import Foundation

final class RandomCreateQuestionsStrategy: CreateQuestionsStrategy {
    
    func createQuestions() -> [Question] {
        
        var listQuestion: [Question] = []
        var sourceListQuestion = Questions().listQuestion

        while sourceListQuestion.count > 0 {
            let index = Int.random(in: 0..<sourceListQuestion.count)
            listQuestion.append(sourceListQuestion[index])
            sourceListQuestion.remove(at: index)
        }
        return listQuestion
    }
}
