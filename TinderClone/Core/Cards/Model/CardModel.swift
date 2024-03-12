//
//  CardModel.swift
//  TinderClone
//
//  Created by User on 13/03/24.
//

import Foundation

struct CardModel {
    let user: User
}

extension CardModel: Identifiable, Hashable {
    var id: String {return user.id}
}
