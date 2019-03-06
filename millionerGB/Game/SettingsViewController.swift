//
//  SettingsViewController.swift
//  millionerGB
//
//  Created by Андрей Тихонов on 05/03/2019.
//  Copyright © 2019 Андрей Тихонов. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    
    @IBOutlet weak var difficultySegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch Game.shared.difficulty {
        case .normal:
            self.difficultySegmentedControl.selectedSegmentIndex = 0
        case .hard:
            self.difficultySegmentedControl.selectedSegmentIndex = 1
        }
    }
    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func difficultySegmentedControl(_ sender: Any) {
        
        switch self.difficultySegmentedControl.selectedSegmentIndex {
        case 0:
            Game.shared.difficulty = .normal
        case 1:
            Game.shared.difficulty = .hard
        default:
            Game.shared.difficulty = .normal
        }
    }
}
