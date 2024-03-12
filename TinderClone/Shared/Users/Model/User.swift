//
//  User.swift
//  TinderClone
//
//  Created by User on 13/03/24.
//

import Foundation

struct User: Identifiable, Hashable {
    let id: String
    let fullname: String
    var age: Int
    var profileImageURLs: [String]
}
