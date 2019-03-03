//
//  GameViewController.swift
//  millionerGB
//
//  Created by Андрей Тихонов on 01/03/2019.
//  Copyright © 2019 Андрей Тихонов. All rights reserved.
//

import UIKit

protocol GameDelegate: class {
    func gameDidEnd(with result: Int, isWin: Bool)
}

protocol GameViewControllerDeligate: AnyObject {
    func update(with question: Question)
    func gameDidEnd(with result: Int, isWin: Bool)
}

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
    
    weak var delegate: GameDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gameSession = GameSession(with: self)
        Game.shared.gameSession = gameSession
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

// MARK: - GameViewControllerDeligate
extension GameViewController: GameViewControllerDeligate {

    func update(with question: Question) {
        questionLabel.text = question.textQuestion
        answerAButton.setTitle("A: " + question.arrayAnswers[0], for: .normal)
        answerBButton.setTitle("B: " + question.arrayAnswers[1], for: .normal)
        answerCButton.setTitle("C: " + question.arrayAnswers[2], for: .normal)
        answerDButton.setTitle("D: " + question.arrayAnswers[3], for: .normal)
    }

    func gameDidEnd(with result: Int, isWin: Bool) {
        self.delegate?.gameDidEnd(with: result, isWin: isWin)
        self.dismiss(animated: true, completion: nil)
    }
}
