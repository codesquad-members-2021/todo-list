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
    let id: String
    let title: String
    let contents: String
    let create_date_time: String
    let status: String
}
