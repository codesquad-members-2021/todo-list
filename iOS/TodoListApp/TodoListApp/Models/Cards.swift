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
}
