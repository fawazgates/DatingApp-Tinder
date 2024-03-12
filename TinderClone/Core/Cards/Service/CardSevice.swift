//
//  CardSevice.swift
//  TinderClone
//
//  Created by User on 13/03/24.
//

import Foundation

struct CardSevice {
    func fetchCarModels() async throws -> [CardModel] {
        let users = MockData.users
        return users.map({ CardModel(user: $0) })
    }
}
