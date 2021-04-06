//
//  Card.swift
//  TodoListApp
//
//  Created by Song on 2021/04/06.
//

import Foundation

class Card {
    private var title: String
    private var description: String
    private let createdAt: Date
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
        self.createdAt = Date()
    }
    
    func replaceTitle(with newTitle: String) {
        title = newTitle
    }
    
    func replaceDescription(with newDescription: String) {
        description = newDescription
    }
}
