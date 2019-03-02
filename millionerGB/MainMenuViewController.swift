//
//  MainMenuViewController.swift
//  millionerGB
//
//  Created by Андрей Тихонов on 02/03/2019.
//  Copyright © 2019 Андрей Тихонов. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {

    @IBOutlet weak var startGameButton: UIButton!
    
    @IBOutlet weak var resultsGameButton: UIButton!
    
    @IBOutlet weak var gameResultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameResultLabel.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "startGameSegue":
            guard let destination = segue.destination as? GameViewController else { return }
            destination.delegate = self
        default:
            break
        }
    }
}

extension MainMenuViewController: GameDelegate {
    
    func gameDidEnd(with result: Int, isWin: Bool) {
        if isWin {
            self.gameResultLabel.text = "Красавчик!"
        } else {
            self.gameResultLabel.text = "Вы запоролись на \(result + 1) вопросе."
        }
    }
}
