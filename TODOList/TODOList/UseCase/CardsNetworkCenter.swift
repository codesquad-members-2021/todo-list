//
//  LoadCards.swift
//  TODOList
//
//  Created by Issac on 2021/04/11.
//

import Foundation

class CardsNetworkCenter {
    typealias KindOfCards = Dictionary<Int, [Card]>
    
    let networking: Networking
    
    init() {
        self.networking = Networking()
    }
    
    func getCards(action: @escaping (KindOfCards) -> Void) {
        let url = "https://793ff2e3-7dec-416a-a0e4-09f4c24be362.mock.pstmn.io/api/cards"
        self.networking.getToDoList(url: url) { (cards) in
            let allStatus = self.manufactureCards(rowCards: cards)
            action(allStatus)
        }
    }
    
    func postCards(card: Card, action: @escaping (KindOfCards) -> Void) {
        let url = "https://793ff2e3-7dec-416a-a0e4-09f4c24be362.mock.pstmn.io/api/cards"
        self.networking.postToDoList(url: url, card: card) { (card) in
            print("Hello")
        }
    }
    
    private func manufactureCards(rowCards: [Card]) -> KindOfCards {
        var sortedCards = KindOfCards()
        for card in rowCards {
            sortedCards[card.columnId, default: [Card]()].append(card)
        }
        return sortCard(cards: sortedCards)
    }
    
    private func sortCard(cards: KindOfCards) -> KindOfCards {
        var sortedCards = cards
        for cards in sortedCards {
            sortedCards[cards.key] = cards.value.sorted(by: { $0.createdDateTime > $1.createdDateTime })
        }
        return sortedCards
    }
}
