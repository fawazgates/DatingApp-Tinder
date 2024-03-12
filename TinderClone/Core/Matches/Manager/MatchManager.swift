//
//  MatchManager.swift
//  TinderClone
//
//  Created by User on 13/03/24.
//

import Foundation

@MainActor
class MatchManager: ObservableObject {
    @Published var matchedUser: User?
    
    func checkForMatch(withUser user: User) {
        
        let didMatch = Bool.random()
        
        if didMatch {
            matchedUser = user
        }
    }
}
