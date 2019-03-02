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
    
    init(with delegate: GameViewControllerDeligate?) {
        self.questions = Questions().listQuestion
        self.questionCoun = questions.count
        guard let delegate = delegate else { return }
        self.delegate = delegate
    }
    
    func start() {
        askAQuestion()
    }
    
    func reply(answer: numberAnswer) {
        if questions[numberQuestion].answer == answer {
            levelUp()
        } else {
            gameOver()
        }
    }
    
    private func askAQuestion() {
        if numberQuestion >= questions.count { return }
        self.delegate?.update(with: questions[numberQuestion])
    }

    private func levelUp() {
        numberQuestion += 1
        if numberQuestion < questionCoun {
            askAQuestion()
        } else {
            gameOver()
        }
    }

    private func gameOver() {
        if numberQuestion < questionCoun {
            self.delegate?.gameDidEnd(with: numberQuestion, isWin: false)
        } else {
            self.delegate?.gameDidEnd(with: numberQuestion, isWin: true)
        }
    }
}
