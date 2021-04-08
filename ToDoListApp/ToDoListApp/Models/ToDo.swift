//
//  ToDo.swift
//  ToDoListApp
//
//  Created by zombietux on 2021/04/06.
//

import Foundation

class ToDo: ToDoManageable {
    enum Status {
        case toDo
        case doing
        case done
    }
    
    private var title: String
    private var contents: String
    private var status: Status
    
    init(title: String, contents: String, status: Status) {
        self.title = title
        self.contents = contents
        self.status = status
    }
    
    convenience init() {
        let title = ""
        let contents = ""
        let status = Status.toDo
        self.init(title: title, contents: contents, status: status)
    }
    
    func add(toDo: ToDo) {
    }
    
    func edit(toDo: ToDo) {
        
    }
    
    func delete(toDo: ToDo) {
        
    }
    
    func goToDone(toDo: ToDo) {
        
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
