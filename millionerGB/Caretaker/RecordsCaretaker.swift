//
//  RecordsCaretaker.swift
//  millionerGB
//
//  Created by Андрей Тихонов on 03/03/2019.
//  Copyright © 2019 Андрей Тихонов. All rights reserved.
//

import Foundation

final class RecordsCareteker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    private let recordsKey = "recordsKey"
    
    func saveRecords(_ records: [Record]) throws {
        let data = try self.encoder.encode(records)
        UserDefaults.standard.set(data, forKey: self.recordsKey)
    }

    func loadRecords() throws -> [Record] {
        guard let data = UserDefaults.standard.data(forKey: self.recordsKey) else { return [] }
        return try self.decoder.decode([Record].self, from: data)
    }
}
