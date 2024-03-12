//
//  MainTabView.swift
//  TinderClone
//
//  Created by User on 12/03/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            CardStackView()
                .tabItem { Image(systemName: "flame") }
                .tag(0)
            
            Text("Search View")
                .tabItem { Image(systemName: "magnifyingglass") }
                .tag(0)
            
            Text("Inbox View")
                .tabItem { Image(systemName: "bubble") }
                .tag(0)
            
            CurrentUserProfileView(user: MockData.users[1])
                .tabItem { Image(systemName: "person") }
                .tag(0)
        }
        .tint(.primary)
    }
}

#Preview {
    MainTabView()
        .environmentObject(MatchManager())
}
