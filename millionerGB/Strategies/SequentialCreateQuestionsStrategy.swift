//
//  SequentialCreateQuestionsStrategy.swift
//  millionerGB
//
//  Created by Андрей Тихонов on 05/03/2019.
//  Copyright © 2019 Андрей Тихонов. All rights reserved.
//

import Foundation

final class SequentialCreateQuestionsStrategy: CreateQuestionsStrategy {
    func createQuestions() -> [Question] {
        return Questions().listQuestion
    }
}
