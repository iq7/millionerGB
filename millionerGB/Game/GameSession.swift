//
//  GameSession.swift
//  millionerGB
//
//  Created by Андрей Тихонов on 02/03/2019.
//  Copyright © 2019 Андрей Тихонов. All rights reserved.
//

import Foundation

final class GameSession {

    private var questions: [Question]?
    var numberQuestion = 0
    
    var createQuestionsStrategy: CreateQuestionsStrategy?

    var onGameEnd: ((Int, Bool) -> Void)?
    var onUpdate: ((Question) -> Void)?
    
    func start() {
        askAQuestion()
    }

    func initQuestions() {
        switch Game.shared.difficulty {
        case .normal:
            self.createQuestionsStrategy = SequentialCreateQuestionsStrategy()
        case .hard:
            self.createQuestionsStrategy = RandomCreateQuestionsStrategy()
        }
        self.questions = self.createQuestionsStrategy?.createQuestions()
    }

    func reply(answer: numberAnswer) {
        if questions?[numberQuestion].answer == answer {
            levelUp()
        } else {
            gameOver()
        }
    }
    
    private func askAQuestion() {
        guard let questions = self.questions else { return }
        if numberQuestion >= questions.count { return }
        self.onUpdate?(questions[numberQuestion])
    }

    private func levelUp() {
        guard let questions = self.questions else { return }
        numberQuestion += 1
        if numberQuestion < questions.count {
            askAQuestion()
        } else {
            gameOver()
        }
    }

    private func gameOver() {
        guard let questions = self.questions else { return }
        let record = Record(date: Date(), score: numberQuestion)
        Game.shared.addRecord(record)
        
        if numberQuestion < questions.count {
            self.onGameEnd?(numberQuestion, false)
        } else {
            self.onGameEnd?(numberQuestion, true)
        }
    }
}
