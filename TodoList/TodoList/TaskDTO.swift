//
//  TaskDTO.swift
//  TodoList
//
//  Created by Ador on 2021/04/13.
//

import Foundation

class TaskDTO {
    private(set) var todos: [Task]
    private(set) var doing: [Task]
    private(set) var done: [Task]
    
    init() {
        todos = []
        doing = []
        done = []
    }
    
    func filter(tasks: [Task]) {
        todos = tasks.filter {
            $0.category == .todo
        }
        doing = tasks.filter {
            $0.category == .progress
        }
        done = tasks.filter {
            $0.category == .done
        }
    }
}
