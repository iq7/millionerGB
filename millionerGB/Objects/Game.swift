//
//  Game.swift
//  millionerGB
//
//  Created by Андрей Тихонов on 02/03/2019.
//  Copyright © 2019 Андрей Тихонов. All rights reserved.
//

import Foundation

final class Game {
    
    static let shared = Game()
    
    private let recordsCaretaker = RecordsCareteker()

    var gameSession: GameSession
    
    private(set) var records: [Record] = [] {
        didSet {
            try? self.recordsCaretaker.saveRecords(self.records)
        }
    }

    private init() {
        self.records = (try? self.recordsCaretaker.loadRecords()) ?? []
        self.gameSession = GameSession()//with: nil)
    }
    
    func addRecord(_ record: Record) {
        self.records.append(record)
    }
    
    func clearRecords() {
        self.records = []
    }
}
