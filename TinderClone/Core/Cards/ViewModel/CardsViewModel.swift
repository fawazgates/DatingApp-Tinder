//
//  CardsViewModel.swift
//  TinderClone
//
//  Created by User on 13/03/24.
//

import Foundation

@MainActor
class CardsViewModel: ObservableObject {
    @Published var cardModels = [CardModel]()
    @Published var buttonSwipeAction: SwipeAction?
    
    private let service: CardSevice
    
    init(service: CardSevice) {
        self.service = service
        Task { await fetchCarModels() }
    }
    
    func fetchCarModels() async {
        do{
            self.cardModels = try await service.fetchCarModels()
        } catch {
            print("DEBUG: Failed to fetch cards with error: \(error)")
        }
    }
    func removeCard(_ card: CardModel) {
        Task {
            guard let index = cardModels.firstIndex(where: { $0.id == card.id }) else {return}
            cardModels.remove(at: index)
        }
    }
}
