//
//  ToDoDataModel.swift
//  TodoList
//
//  Created by Jun Ho JANG on 2021/04/06.
//

import Foundation

//struct ToDoItems: Codable {
//    let toBeDone: [ToDoItem]
//    let onProgress: [ToDoItem]
//    let completed: [ToDoItem]
//}

struct ToDoItem: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
    
    func getTitleString() -> String {
        return "\(userId), \(id), \(title), \(completed)"
    }
}
