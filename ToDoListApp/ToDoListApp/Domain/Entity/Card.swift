//
//  Card.swift
//  ToDoListApp
//
//  Created by zombietux on 2021/04/06.
//

import Foundation

class Card: CardManageable, Decodable {
    
    private var id: Int
    private var title: String
    private var contents: String
    private var columnId: Int
    
    init(id: Int, title: String, contents: String, columnId: Int) {
        self.id = id
        self.title = title
        self.contents = contents
        self.columnId = columnId
    }
    
    convenience init() {
        let id = 1
        let title = ""
        let contents = ""
        let columnId = 1
        self.init(id: id, title: title, contents: contents, columnId: columnId)
    }
    
    func add() {
    }
    
    func edit() {
        
    }
    
    func delete() {
        
    }
    
    func goToDone() {
        
    }
    
    func getTitle() -> String {
        return self.title
    }
    
    func getContents() -> String {
        return self.contents
    }
}

class Board: Decodable {
    
    var title: String
    var cards: [Card]
    
    init(title: String, cards: [Card]) {
        self.title = title
        self.cards = cards
    }
}
