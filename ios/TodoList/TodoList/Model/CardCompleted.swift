//
//  CardCompleted.swift
//  TodoList
//
//  Created by 조중윤 on 2021/04/07.
//

import Foundation

class CardCompleted: ToDoCardProtocol {
    var cards: [ToDoCard]
    
    init(cards: [ToDoCard]) {
        self.cards = cards
    }
    
    func insertCard(newCard: ToDoCard, at order: Int) {
        self.cards.insert(newCard, at: order)
    }
    
    func deleteCard(at index: Int) {
        self.cards.remove(at: index)
    }
    
    func moveCard(at sourceIndex: Int, to destinationIndex: Int) {
        guard sourceIndex != destinationIndex else { return }
        
        let place = cards[sourceIndex]
        cards.remove(at: sourceIndex)
        cards.insert(place, at: destinationIndex)
    }
    
    func amendCard(with newTitle: String, at index: Int) {
        self.cards[index].amend(newTitle: newTitle)
    }
}
