//
//  ToDoDataModel.swift
//  TodoList
//
//  Created by Jun Ho JANG on 2021/04/06.
//

import Foundation

struct ToDoList: Codable {
    let todo: [ToDoItem]
    let doing: [ToDoItem]
    let done: [ToDoItem]
    
    func getTodoListString() -> String {
        return "\(todo), \(doing), \(done)"
    }
}

struct ToDoItem: Codable {
    let id: Int
    let title: String
    let contents: String
    let createDateTime: String
    let status: String
    
    init(id: Int, title: String, contents: String, createDateTime: String, status: String) {
        self.id = id
        self.title = title
        self.contents = contents
        self.createDateTime = createDateTime
        self.status = status
    }
}
