//
//  Card.swift
//  ToDoListApp
//
//  Created by zombietux on 2021/04/06.
//

import Foundation

class Card: CardManageable, Decodable {
    private var title: String
    private var contents: String
    
    init(title: String, contents: String) {
        self.title = title
        self.contents = contents
    }
    
    convenience init() {
        let title = ""
        let contents = ""
        self.init(title: title, contents: contents)
    }
    
    func add() {
    }
    
    func edit() {
        
    }
    
    func delete() {
        
    }
    
    func goToDone() {
        
    }
}

class Board: Codable {
    
    var title: String
    var items: [String]
    
    init(title: String, items: [String]) {
        self.title = title
        self.items = items
    }
}
