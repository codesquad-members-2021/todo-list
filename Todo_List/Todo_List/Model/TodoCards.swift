//
//  TodoCards.swift
//  Todo_List
//
//  Created by Lia on 2021/04/07.
//

import UIKit

protocol TodoCardsManageable {
    func getCard(at indexPath: IndexPath) -> TodoCard
    func addCard(with card: TodoCard)
    func countCards() -> Int
    func removeCard(at indexPath: IndexPath)
    func insertCard(item: TodoCard, at indexPath: IndexPath)
}


class TodoCards: TodoCardsManageable  {
    
    private var cards: [TodoCard]
    
    init(cards: [TodoCard]) {
        self.cards = cards
    }
    
    convenience init() {        
        self.init(cards: [TodoCard()])
    }
    
    func getCard(at indexPath: IndexPath) -> TodoCard {
        return cards[indexPath.item]
    }
    
    func addCard(with card: TodoCard) {
        self.cards.append(card)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "addCard"), object: nil)
    }
    
    func countCards() -> Int {
        return cards.count
    }
    
    func removeCard(at indexPath: IndexPath) {
        cards.remove(at: indexPath.row)
    }
    
    func insertCard(item: TodoCard, at indexPath: IndexPath) {
        cards.insert(item, at: indexPath.row)
    }
}



