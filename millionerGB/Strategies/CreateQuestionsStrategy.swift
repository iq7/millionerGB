//
//  CreateQuestionsStrategy.swift
//  millionerGB
//
//  Created by Андрей Тихонов on 05/03/2019.
//  Copyright © 2019 Андрей Тихонов. All rights reserved.
//

import Foundation

protocol CreateQuestionsStrategy: AnyObject {
    func createQuestions() -> [Question]
}
