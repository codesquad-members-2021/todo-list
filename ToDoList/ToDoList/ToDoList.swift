//
//  ToDoList.swift
//  ToDoList
//
//  Created by 오킹 on 2021/04/06.
//

import Foundation

class TodoList: List {

    convenience init(number: Int, title: String, content: String) {
        self.init(state: .todo, number: number, title: title, content: content)
    }
}
