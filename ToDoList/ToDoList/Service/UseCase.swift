//
//  UseCase.swift
//  ToDoList
//
//  Created by 오킹 on 2021/04/08.
//

import Foundation
import Combine

class UseCase {
    private var cardNetworkManager: CardNetworkManagerProtocol
    //MARK: - 카드 가져와서 일단 여기에 넣음 수정 필요
    @Published var cards: [Card] = [] {
        didSet {
            print(self.cards.count)
        }
    }
    
    var subscriptions = Set<AnyCancellable>()
    
    init(cardNetworkManager: CardNetworkManagerProtocol) {
        self.cardNetworkManager = cardNetworkManager
    }
    
    convenience init() {
        let cardNetworkManager = CardNetworkManager()
        self.init(cardNetworkManager: cardNetworkManager)
    }
    
    func showCards() {
        cardNetworkManager.getCards()
        .replaceError(with: [])
        .assign(to: \.cards, on: self)
        .store(in: &subscriptions)
    }
}
