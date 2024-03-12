//
//  CardStackView.swift
//  TinderClone
//
//  Created by User on 13/03/24.
//

import SwiftUI

struct CardStackView: View {
    
    @EnvironmentObject var matchManager: MatchManager
    @State private var showMatchView = false
    @StateObject var viewModel = CardsViewModel(service: CardSevice())
    
    var body: some View {
        NavigationStack {
            ZStack {
            VStack(spacing: 16) {
                ZStack {
                    ForEach(viewModel.cardModels) { card in
                        CardView(viewModel: viewModel, model: card)
                    }
                }
                
                if !viewModel.cardModels.isEmpty {
                    SwipeActionButtonView(viewModel: viewModel)
                }
            }
            .blur(radius: showMatchView ? 20 : 0)
                if showMatchView {
                    UserMatchView(show: $showMatchView)
                }
            }
            .animation(.easeOut, value: showMatchView)
            .onReceive(matchManager.$matchedUser) { user in
                showMatchView = user != nil
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(.tinder)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 88)

            }
            }
        }
    }
}

#Preview {
    CardStackView()
        .environmentObject(MatchManager())
}
