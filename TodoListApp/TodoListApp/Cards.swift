//
//  Cards.swift
//  TodoListApp
//
//  Created by Song on 2021/04/06.
//

import Foundation

class Cards {
    private var cards: [Card]
    private var numberOfCard: Int {
        return cards.count
    }
    
    init(cards: [Card]) {
        self.cards = cards
    }
    
    func add(_ card: Card) {
        cards.append(card)
    }
    
    func remove(_ card: Card) {
        if let index = cards.firstIndex(where: { selectedCard in
            ObjectIdentifier(card) == ObjectIdentifier(selectedCard)
        }) {
            cards.remove(at: index)
        }
    }
    
    //FIXME: - Cards가 상위 모듈 List 알고 있는 것이 이상 (수정 필요)
    func move(_ card: Card, to list: List) {
        remove(card)
        list.add(card)
    }
}
