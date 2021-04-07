//
//  ToDoCard.swift
//  TodoList
//
//  Created by 조중윤 on 2021/04/07.
//

import Foundation

class ToDoCard {
    let userId: Int
    let id: Int
    var title: String
    let completed: Bool
    
    init(userId: Int, id: Int, title: String, completed: Bool) {
        self.userId = userId
        self.id = id
        self.title = title
        self.completed = completed
    }
    
    func amend(newTitle: String) {
        self.title = newTitle
    }
}
