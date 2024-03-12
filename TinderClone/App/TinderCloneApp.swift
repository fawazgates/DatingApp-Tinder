//
//  TinderCloneApp.swift
//  TinderClone
//
//  Created by User on 12/03/24.
//

import SwiftUI
import SwiftData

@main
struct TinderCloneApp: App {
    @StateObject var matchManager = MatchManager()
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(matchManager)
        }
    }
}
