//
//  GameSession.swift
//  millionerGB
//
//  Created by Андрей Тихонов on 02/03/2019.
//  Copyright © 2019 Андрей Тихонов. All rights reserved.
//

import Foundation

class GameSession {

    private var questions: [Question] = []

    var numberQuestion = 0
    let questionCoun: Int
    
    weak var delegate: GameViewControllerDeligate?
    
    init(with questions: [Question], and delegate: GameViewControllerDeligate?) {
        
        self.questions = questions
        self.questionCoun = questions.count
        
        guard let delegate = delegate else { return }
        self.delegate = delegate
    }
    
    func askAQuestion() {
        if numberQuestion >= questions.count { return }
        print(questions[numberQuestion].textQuestion)
        self.delegate?.update(with: questions[numberQuestion])
        numberQuestion += 1
    }
    
}
