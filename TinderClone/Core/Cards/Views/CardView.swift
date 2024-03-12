//
//  CardView.swift
//  TinderClone
//
//  Created by User on 12/03/24.
//

import SwiftUI

struct CardView: View {
    @EnvironmentObject var matchManager: MatchManager
    @ObservedObject var viewModel: CardsViewModel
    
    @State private var xoffset: CGFloat = 0
    @State private var degrees: Double = 0
    @State private var currentImageIndex = 0
    @State private var showProfileModal = false
    
    let model: CardModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                Image(user.profileImageURLs[currentImageIndex])
                    .resizable()
                    .scaledToFill()
                    .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
                    .overlay {
                        ImageScrollingOverlay(currentImageIndex: $currentImageIndex, imageCount: imageCount)
                    }
                
                CardImageIndicatorsView(currentImageIndex: currentImageIndex, imageCount: imageCount)
                
                SwipeActionIndicatorView(xOffset: $xoffset)
            }
            
            UserInfoView(showProfileModal: $showProfileModal, user: user)
        }
        .fullScreenCover(isPresented: $showProfileModal) {
            UserProfileView(user: user)
        }
        .onReceive(viewModel.$buttonSwipeAction, perform: { action in
            onReceiveSwipeAction(action)
        })
        .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .offset(x: xoffset)
        .rotationEffect(.degrees(degrees))
//        .animation(.snappy, value: xoffset)
        .gesture(
            DragGesture()
                .onChanged(onDragChanged)
                .onEnded(onDragEnded)
        )
    }
}

private extension CardView {
    var user: User {
        return model.user
    }
    
    var imageCount: Int {
        return user.profileImageURLs.count
    }
}

private extension CardView {
    func returnToCenter() {
        xoffset = 0
        degrees = 0
    }
    
    func swipeRight() {
        
        withAnimation{
            xoffset = 500
            degrees = 12
        } completion: {
            viewModel.removeCard(model)
        }
    }
    
    func swipeLeft() {
        
        withAnimation{
            xoffset = -500
            degrees = -12
        } completion: {
            viewModel.removeCard(model)
            matchManager.checkForMatch(withUser: user)
        }
    }
    
    func onReceiveSwipeAction(_ action: SwipeAction?) {
        guard let action else {return}
        
        let topCard = viewModel.cardModels.last
        
        if topCard == model {
            switch action {
            case .reject:
                swipeLeft()
            case .like:
                swipeRight()
            }
        }
    }
}

private extension CardView {
    func onDragChanged(_ value: DragGesture.Value){
        xoffset = value.translation.width
        degrees = Double(value.translation.width / 25)
    }
    func onDragEnded(_ value: DragGesture.Value){
        let width = value.translation.width
        
        if abs(width) <= abs(SizeConstants.screenCutoff) {
            returnToCenter()
            return
        }
        
        if width >= SizeConstants.screenCutoff {
            swipeRight()
        } else {
            swipeLeft()
        }
    }
}

#Preview {
    CardView(viewModel: CardsViewModel(service: CardSevice()), model: CardModel(user: MockData.users[1]))
}
