//
//  Card.swift
//  ToDoListApp
//
//  Created by 지북 on 2021/04/08.
//

import Foundation

class Card {
    var title: String
    var body: String
    var author: String
    var date: Date
    var states: States
    
    
    init(title: String, body: String, author: String, states: States) {
        self.title = title
        self.body = body
        self.author = author
        self.date = Date()
        self.states = states
    }
}
