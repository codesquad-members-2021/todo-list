//
//  Board.swift
//  ToDoListApp
//
//  Created by zombietux on 2021/04/12.
//

import Foundation

class Board {
    private var cards: [CardManageable]
    
    init(cards: [CardManageable]) {
        self.cards = cards
    }
    
    convenience init() {
        let cards = [Card]()
        self.init(cards: cards)
    }
    
    func count() -> Int {
        return self.cards.count
    }
    
    func forEachCards(handler: (CardManageable) -> ()) {
        cards.forEach { card in
            handler(card)
        }
    }
    
    func getCards() -> [CardManageable] {
        return self.cards
    }
    
    func appendCard(_ card: CardManageable) {
        self.cards.append(card)
    }
    
    func removeCard(at index: Int) {
        self.cards.remove(at: index)
    }
    
    func insertCard(card: CardManageable, at destinationIndex: Int) {
        self.cards.insert(card, at: destinationIndex)
    }
    
//    func getBoard() -> Board {
//        return Board()
//    }
//    
//    func getTitle() -> String {
//        return ""
//    }
}
