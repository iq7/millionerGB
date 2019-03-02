//
//  Game.swift
//  millionerGB
//
//  Created by Андрей Тихонов on 02/03/2019.
//  Copyright © 2019 Андрей Тихонов. All rights reserved.
//

import Foundation

class Game {
    
    static let shared = Game(gameSession: nil)

    var gameSession: GameSession?

    private init(gameSession: GameSession?) {
        guard let gameSession = gameSession else { return }
        self.gameSession? = gameSession
    }
}
