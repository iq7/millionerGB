//
//  GameViewController.swift
//  millionerGB
//
//  Created by Андрей Тихонов on 01/03/2019.
//  Copyright © 2019 Андрей Тихонов. All rights reserved.
//

import UIKit

final class GameViewController: UIViewController {

    @IBOutlet weak var currentWin: UILabel!
    @IBOutlet weak var guaranteedWin: UILabel!
    @IBOutlet weak var progress: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerAButton: UIButton!
    @IBOutlet weak var answerBButton: UIButton!
    @IBOutlet weak var answerCButton: UIButton!
    @IBOutlet weak var answerDButton: UIButton!
    
    @IBOutlet weak var fiftyFiftyButton: UIButton!
    @IBOutlet weak var callFriendButton: UIButton!
    @IBOutlet weak var auditoryHelpButton: UIButton!
    @IBOutlet weak var marginForErrorButton: UIButton!
    
    var onGameEnd: ((Int, Bool) -> Void)?

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gameSession = GameSession()
        gameSession.initQuestions()
        Game.shared.gameSession = gameSession

        gameSession.onGameEnd = { [weak self] result, isWin in
            guard let self = self else { return }
            self.onGameEnd?(result, isWin)
            self.dismiss(animated: true, completion: nil)
        }

        gameSession.onUpdate = { [weak self] question in
            guard let self = self else { return }
            self.questionLabel.text = question.textQuestion
            self.answerAButton.setTitle("A: " + question.arrayAnswers[0], for: .normal)
            self.answerBButton.setTitle("B: " + question.arrayAnswers[1], for: .normal)
            self.answerCButton.setTitle("C: " + question.arrayAnswers[2], for: .normal)
            self.answerDButton.setTitle("D: " + question.arrayAnswers[3], for: .normal)
            self.updateVisibleButton()
        }
        
        gameSession.onShowHint = { [weak self] title, message in
            guard let self = self else { return }
            self.showHint(with: title, message: message)
        }

        Game.shared.gameSession.start()
        
        Game.shared.gameSession.currentWin.addObserver(self, options: [.initial, .new]) { (newValue, _) in
            self.currentWin.text = "Текущий выигрыш: \(Game.shared.gameSession.currentWin.value)"
        }
        Game.shared.gameSession.guaranteedWin.addObserver(self, options: [.initial, .new]) { (newValue, _) in
            self.guaranteedWin.text = "Несгораемая сумма: \(Game.shared.gameSession.guaranteedWin.value)"
        }
        Game.shared.gameSession.numberQuestion.addObserver(self, options: [.initial, .new]) { (newValue, _) in
            self.progress.text = "Вопрос №\(Game.shared.gameSession.numberQuestion.value + 1). Прогресс: \(Game.shared.gameSession.progress.value)"
        }
        Game.shared.gameSession.progress.addObserver(self, options: [.initial, .new]) { (newValue, _) in
            self.progress.text = "Вопрос №\(Game.shared.gameSession.numberQuestion.value + 1). Прогресс: \(Game.shared.gameSession.progress.value)"
        }
    }
    
    private func updateVisibleButton() {
        self.answerAButton.isEnabled = Game.shared.gameSession.visibleAnswers.enabledA
        self.answerBButton.isEnabled = Game.shared.gameSession.visibleAnswers.enabledB
        self.answerCButton.isEnabled = Game.shared.gameSession.visibleAnswers.enabledC
        self.answerDButton.isEnabled = Game.shared.gameSession.visibleAnswers.enabledD
        self.fiftyFiftyButton.isEnabled = Game.shared.gameSession.hints.fiftyFiftyHint
        self.callFriendButton.isEnabled = Game.shared.gameSession.hints.callFriend
        self.auditoryHelpButton.isEnabled = Game.shared.gameSession.hints.auditoryHelp
        self.marginForErrorButton.isEnabled = Game.shared.gameSession.hints.marginForError
    }
    
    private func showHint(with title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ну, ок", style: .default) { action in
        }
        alertController.addAction(action)
        self.present(alertController,animated: true, completion: nil)
    }

    @IBAction func answerAButtonPressed(_ sender: UIButton) {
        Game.shared.gameSession.reply(answer: 0)//.answerA)
        updateVisibleButton()
    }
    
    @IBAction func answerBButtonPressed(_ sender: UIButton) {
        Game.shared.gameSession.reply(answer: 1)//.answerB)
        updateVisibleButton()
    }
    
    @IBAction func answerCButtonPressed(_ sender: UIButton) {
        Game.shared.gameSession.reply(answer: 2)//.answerC)
        updateVisibleButton()
    }
    
    @IBAction func answerDButtonPressed(_ sender: UIButton) {
        Game.shared.gameSession.reply(answer: 3)//.answerD)
        updateVisibleButton()
    }
    
    @IBAction func fiftyFiftyButtonPressed(_ sender: UIButton) {
        Game.shared.gameSession.use50to50Hint()
        updateVisibleButton()
    }
    
    @IBAction func callFriendButtonPressed(_ sender: UIButton) {
        Game.shared.gameSession.callFriend()
        updateVisibleButton()
    }
    
    @IBAction func auditoryHelpButtonPressed(_ sender: UIButton) {
        Game.shared.gameSession.useAuditoryHelp()
        updateVisibleButton()
    }
    
    @IBAction func marginForErrorButtonPressed(_ sender: UIButton) {
        Game.shared.gameSession.useMarginForError()
        updateVisibleButton()
    }
}
