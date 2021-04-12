//
//  LoadCards.swift
//  TODOList
//
//  Created by Issac on 2021/04/11.
//

import Foundation

class LoadCards {
    typealias SortedCards = Dictionary<Int, [Status]>
    
    let networking: Networking
    
    init() {
        self.networking = Networking()
    }
    
    func getCards(action: @escaping (SortedCards) -> Void) {
        let url = "https://793ff2e3-7dec-416a-a0e4-09f4c24be362.mock.pstmn.io/api/cards"
        self.networking.getToDoList(url: url) { (cards) in
            let allStatus = self.manufactureStatus(rowCards: cards)
            action(allStatus)
        }
    }
    
    func manufactureStatus(rowCards: [Card]) -> SortedCards {
        var result = Dictionary<Int, [Status]>()
        for card in rowCards {
            let status = Status(id: card.id,
                                title: card.title,
                                contents: card.contents,
                                columnId: card.columnId,
                                createdDateTime: card.createdDateTime)
            result[card.columnId, default: [Status]()].append(status)
        }
        
        return sortCard(cards: result)
    }
    
    func sortCard(cards: SortedCards) -> SortedCards {
        var sortedCards = cards
        for cards in sortedCards {
            sortedCards[cards.key] = cards.value.sorted(by: { $0.createdDateTime > $1.createdDateTime })
        }
        return sortedCards
    }
}
