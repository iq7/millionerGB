//
//  GameSession.swift
//  millionerGB
//
//  Created by Андрей Тихонов on 02/03/2019.
//  Copyright © 2019 Андрей Тихонов. All rights reserved.
//

import Foundation

final class GameSession {

    private var questions: [Question] = []

    var numberQuestion = 0
    
    weak var delegate: GameViewControllerDeligate?
    
    init(with delegate: GameViewControllerDeligate?) {
        self.questions = Questions().listQuestion
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
        if numberQuestion < questions.count {
            askAQuestion()
        } else {
            gameOver()
        }
    }

    private func gameOver() {
        let record = Record(date: Date(), score: numberQuestion)
        Game.shared.addRecord(record)
        
        if numberQuestion < questions.count {
            self.delegate?.gameDidEnd(with: numberQuestion, isWin: false)
        } else {
            self.delegate?.gameDidEnd(with: numberQuestion, isWin: true)
        }
    }
}
