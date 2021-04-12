//
//  Card.swift
//  ToDoListApp
//
//  Created by zombietux on 2021/04/06.
//

import Foundation

class Card: CardManageable, Codable {
    
    private var id: Int?
    private var title: String
    private var contents: String
    private var columnId: Int?
    
    init(id: Int?, title: String, contents: String, columnId: Int?) {
        self.id = id
        self.title = title
        self.contents = contents
        self.columnId = columnId
    }
    
    convenience init(title: String, contents: String) {
        self.init(id: nil, title: title, contents: contents, columnId: nil)
    }
    
    convenience init() {
        let id = Int()
        let title = ""
        let contents = ""
        let columnId = Int()
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
