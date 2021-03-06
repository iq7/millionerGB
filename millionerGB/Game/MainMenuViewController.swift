//
//  MainMenuViewController.swift
//  millionerGB
//
//  Created by Андрей Тихонов on 02/03/2019.
//  Copyright © 2019 Андрей Тихонов. All rights reserved.
//

import UIKit

final class MainMenuViewController: UIViewController {

    @IBOutlet weak var startGameButton: UIButton!
    
    @IBOutlet weak var settingButton: UIButton!
    
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
            destination.onGameEnd = { [weak self] result, isWin in
                guard let self = self else { return }
                if isWin {
                    self.gameResultLabel.text = "Красавчик!"
                } else {
                    self.gameResultLabel.text = "Вы запоролись на \(result + 1) вопросе."
                }
            }
        default:
            break
        }
    }
}
