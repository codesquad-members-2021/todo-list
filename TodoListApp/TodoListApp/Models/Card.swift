//
//  Card.swift
//  TodoListApp
//
//  Created by Song on 2021/04/06.
//

import Foundation

class Card {
    var title: String
    var description: String
    let createdAt: Date
    let category: String
    
    init(title: String, description: String, category: String) {
        self.title = title
        self.description = description
        self.createdAt = Date()
        self.category = category
    }
}
