//
//  GameViewController.swift
//  millionerGB
//
//  Created by Андрей Тихонов on 01/03/2019.
//  Copyright © 2019 Андрей Тихонов. All rights reserved.
//

import UIKit

final class GameViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerAButton: UIButton!
    @IBOutlet weak var answerBButton: UIButton!
    @IBOutlet weak var answerCButton: UIButton!
    @IBOutlet weak var answerDButton: UIButton!
    
    @IBOutlet weak var fiftyFiftyButton: UIButton!
    @IBOutlet weak var callToFriendButton: UIButton!
    @IBOutlet weak var hallHelpButton: UIButton!
    @IBOutlet weak var marginForErrorButton: UIButton!
    
    var onGameEnd: ((Int, Bool) -> Void)?

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
        }
        
        Game.shared.gameSession.start()
    }

    @IBAction func answerAButtonPressed(_ sender: UIButton) {
        Game.shared.gameSession.reply(answer: .answerA)
    }
    
    @IBAction func answerBButtonPressed(_ sender: UIButton) {
        Game.shared.gameSession.reply(answer: .answerB)
    }
    
    @IBAction func answerCButtonPressed(_ sender: UIButton) {
        Game.shared.gameSession.reply(answer: .answerC)
    }
    
    @IBAction func answerDButtonPressed(_ sender: UIButton) {
        Game.shared.gameSession.reply(answer: .answerD)
    }
    
    @IBAction func fiftyFiftyButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func callToFriendButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func hallHelpButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func marginForErrorButtonPressed(_ sender: UIButton) {
    }
}
