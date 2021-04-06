//
//  List.swift
//  TodoListApp
//
//  Created by Song on 2021/04/06.
//

import Foundation

class List {
    // yj: done, doing 속성 추가해 subclassing?
    private var name: String
    private var cards: Cards
    
    init(name: String, cards: Cards) {
        self.name = name
        self.cards = cards
    }
    
    func add(_ card: Card) {
        cards.add(card)
    }
    
    func remove(_ card: Card) {
        cards.remove(card)
    }
    
    func move(_ card: Card, to list: List) {
        cards.move(card, to: list)
    }
}
