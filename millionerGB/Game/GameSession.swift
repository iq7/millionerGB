//
//  GameSession.swift
//  millionerGB
//
//  Created by Андрей Тихонов on 02/03/2019.
//  Copyright © 2019 Андрей Тихонов. All rights reserved.
//

import Foundation
import UIKit

final class GameSession {

    private var questions: [Question]?
    var numberQuestion: Observable<Int> = Observable(0)

    private var questionCount:Int {
        return self.questions?.count ?? 0
    }
    
    private let arrayWin = [0, 100, 200, 300, 500, 1000, 2000, 4000, 8000, 16000, 32000, 64000, 125000, 250000, 500000, 1000000]
 
    var currentWin: Observable<Int> = Observable(0)
    var guaranteedWin: Observable<Int> = Observable(0)
    
    var progress: Observable<Double> = Observable(0.0)

    var hints = Hints()
    var visibleAnswers = VisibleAnswers()
    private var isUseMarginForError = false

    private var createQuestionsStrategy: CreateQuestionsStrategy?

    var onGameEnd: ((Int, Bool) -> Void)?
    var onUpdate: ((Question) -> Void)?
    var onShowHint: ((String, String) -> Void)?

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

    func use50to50Hint() {
        
        if !self.hints.fiftyFiftyHint { return }

        guard let questions = self.questions else { return }

        var repeatCount = 2
        while repeatCount > 0 {
            let randomAnswer = Int.random(in: 0...3)
            if randomAnswer != questions[self.numberQuestion.value].answer {//}.rawValue {
                switch randomAnswer {
                case 0:
                    if self.visibleAnswers.enabledA {
                        self.visibleAnswers.enabledA = false
                        repeatCount -= 1
                    }
                case 1:
                    if self.visibleAnswers.enabledB {
                        self.visibleAnswers.enabledB = false
                        repeatCount -= 1
                    }
                case 2:
                    if self.visibleAnswers.enabledC {
                        self.visibleAnswers.enabledC = false
                        repeatCount -= 1
                    }
                case 3:
                    if self.visibleAnswers.enabledD {
                        self.visibleAnswers.enabledD = false
                        repeatCount -= 1
                    }
                default: break
                }
            }
        }
        
        self.hints.fiftyFiftyHint = false
    }
    
    func callFriend() {
        
        self.hints.callFriend = false
        
        var friendAnswer = "Я не знаю("
        guard let questions = self.questions else {
            self.onShowHint?("Ответ друга:", friendAnswer)
            return
        }

        var isComplitAnswer = false
        repeat {
            let randomAnswer = Int.random(in: 0...4)
            let answers = questions[self.numberQuestion.value].arrayAnswers
            if randomAnswer < answers.count {
                friendAnswer = "Чё ты думаешь.\nПравильный ответ -\n\(answers[randomAnswer]).\nЯтеговорю!"
            }
            
            switch randomAnswer {
            case 0:
                if self.visibleAnswers.enabledA { isComplitAnswer = true }
            case 1:
                if self.visibleAnswers.enabledB { isComplitAnswer = true }
            case 2:
                if self.visibleAnswers.enabledC { isComplitAnswer = true }
            case 3:
                if self.visibleAnswers.enabledD { isComplitAnswer = true }
            default: break
            }

        } while !isComplitAnswer
        
        self.onShowHint?("Ответ друга:", friendAnswer)
    }
    
    func useAuditoryHelp() {

        self.hints.auditoryHelp = false
        
        var answerA = 0
        var answerB = 0
        var answerC = 0
        var answerD = 0
        
        var auditoryCount = 0
        while auditoryCount < 100 {
            let randomAnswer = Int.random(in: 0...3)
            
            switch randomAnswer {
            case 0:
                if self.visibleAnswers.enabledA {
                    answerA += 1
                    auditoryCount += 1
                }
            case 1:
                if self.visibleAnswers.enabledB {
                    answerB += 1
                    auditoryCount += 1
                }
            case 2:
                if self.visibleAnswers.enabledC {
                    answerC += 1
                    auditoryCount += 1
                }
            case 3:
                if self.visibleAnswers.enabledD {
                    answerD += 1
                    auditoryCount += 1
                }
            default: break
            }
        }
        
        let auditoryAnswer = "" +
            (answerA > 0 ? "Ответ A: \(answerA)%\n" : "") +
            (answerB > 0 ? "Ответ B: \(answerB)%\n" : "") +
            (answerC > 0 ? "Ответ C: \(answerC)%\n" : "") +
            (answerD > 0 ? "Ответ D: \(answerD)%" : "")
        self.onShowHint?("Аудитория проголосовала:", auditoryAnswer)
    }
    
    func useMarginForError() {
        self.hints.marginForError = false
        self.isUseMarginForError = true
    }

    func reply(answer: Int) {//numberAnswer) {
        if questions?[self.numberQuestion.value].answer == answer {
            levelUp()
        } else {
            if isUseMarginForError {
                switch answer {
                case 0://.answerA:
                    self.visibleAnswers.enabledA = false
                case 1://.answerB:
                    self.visibleAnswers.enabledB = false
                case 2://.answerC:
                    self.visibleAnswers.enabledC = false
                case 3://.answerD:
                    self.visibleAnswers.enabledD = false
                default:
                    break
                }
                isUseMarginForError = false
                self.onShowHint?("Ошибочка!", "Попробуй еще.")
            } else {
                gameOver()
            }
        }
    }

    private func askAQuestion() {
        guard let questions = self.questions else { return }
        self.visibleAnswers = VisibleAnswers()
        if self.numberQuestion.value >= questions.count { return }
        self.onUpdate?(questions[self.numberQuestion.value])
    }

    private func levelUp() {

        guard let questions = self.questions else { return }

        self.numberQuestion.value += 1
        self.progress.value = self.questionCount == 0 ? 0.0 : Double(self.numberQuestion.value) / Double(self.questionCount) * 100.0
        self.currentWin.value = arrayWin[self.numberQuestion.value]
        switch self.numberQuestion.value {
        case 1...5:
            self.guaranteedWin.value = 100
        case 6...10:
            self.guaranteedWin.value = 1000
        case 11...15:
            self.guaranteedWin.value = 32000
        case 15:
            self.guaranteedWin.value = 1000000
        default:
            self.guaranteedWin.value = 0
        }

        if self.numberQuestion.value < questions.count {
            askAQuestion()
        } else {
            gameOver()
        }
    }

    private func gameOver() {
        guard let questions = self.questions else { return }
        let record = Record(date: Date(), score: self.progress.value)
        Game.shared.addRecord(record)
        
        if self.numberQuestion.value < questions.count {
            self.onGameEnd?(self.numberQuestion.value, false)
        } else {
            self.onGameEnd?(self.numberQuestion.value, true)
        }
        
        Game.shared.gameSession = GameSession()
    }
}
