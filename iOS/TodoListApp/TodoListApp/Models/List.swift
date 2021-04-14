//
//  List.swift
//  TodoListApp
//
//  Created by Song on 2021/04/06.
//

import Foundation

class List {
    private var name: String
    private var cards: Cards
    
    init(name: String, cards: Cards) {
        self.name = name
        self.cards = cards
    }
}
