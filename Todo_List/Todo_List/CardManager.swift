//
//  CardManager.swift
//  Todo_List
//
//  Created by Lia on 2021/04/12.
//

import Foundation

enum DoType {
    case todo
    case doing
    case done
}

protocol CardManageable {
    func getCards(type: DoType) -> TodoCardsManageable
    func addCard(type: DoType, card: TodoCard)
}


class CardManager: CardManageable {
    
    private let todoCards: TodoCardsManageable
    private let doingCards: TodoCardsManageable
    private let doneCards: TodoCardsManageable
    
    private let doType: [DoType: TodoCardsManageable]
    
    
    init(todo: TodoCardsManageable, doing: TodoCardsManageable, done: TodoCardsManageable ) {
        self.todoCards = todo
        self.doingCards = doing
        self.doneCards = done
        self.doType = [.todo: self.todoCards, .doing: self.doingCards, .done: self.doneCards]
    }
    
    convenience init() {
        self.init(todo: TodoCards(), doing: TodoCards(), done: TodoCards())
    }
    
    
    func getCards(type: DoType) -> TodoCardsManageable {
        return self.doType[type] ?? TodoCards()
    }
    
    func addCard(type: DoType, card: TodoCard) {
        self.doType[type]?.addCard(with: card)
    }
    
    
    
}
