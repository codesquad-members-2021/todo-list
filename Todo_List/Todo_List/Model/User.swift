//
//  User.swift
//  Todo_List
//
//  Created by Lia on 2021/04/08.
//

import Foundation

class User {
    
    private var name: String
    private var profileURL: String
    private var todoCards: TodoCardsManageable
    
    init(name: String, url: String, cards: TodoCardsManageable) {
        self.name = name
        self.profileURL = url
        self.todoCards = cards
    }
    
    convenience init() {
        let name = "name"
        let url = "http"
        let cards = TodoCards()
        
        self.init(name: name, url: url, cards: cards)
    }
    
}
