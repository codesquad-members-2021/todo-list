//
//  Card.swift
//  TodoListApp
//
//  Created by Song on 2021/04/06.
//

import Foundation

class Card {
    var title: String
    var notes: String
    let createdAt: Date
    let category: String
    
    init(title: String, notes: String, category: String) {
        self.title = title
        self.notes = notes
        self.createdAt = Date()
        self.category = category
    }
}
