//
//  MockData.swift
//  TinderClone
//
//  Created by User on 13/03/24.
//

import Foundation

struct MockData {
    
    static let users: [User] = [
        .init(id: NSUUID().uuidString, 
              fullname: "Ronaldo",
              age: 37,
              profileImageURLs: ["ronaldo", "ronaldo1"]
             ),
        
        .init(id: NSUUID().uuidString,
                  fullname: "Ronaldo",
                  age: 37,
                  profileImageURLs: ["ronaldo", "ronaldo1"]
                 ),
        .init(id: NSUUID().uuidString,
              fullname: "Ronaldo",
              age: 37,
              profileImageURLs: ["ronaldo", "ronaldo1"]
             ),
    ]
}
