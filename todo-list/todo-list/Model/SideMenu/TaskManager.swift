//
//  TaskList.swift
//  todo-list
//
//  Created by Song on 2021/04/14.
//

import Foundation

struct Task {
    let nickname: String
    let content: String
    let time: Date
}


class TaskManager {

    private var list = [Task]()
    
    func add(task: Task) {
        list.append(task)
    }
}

extension TaskManager: TaskFinddable {
    
    func count() -> Int {
        return list.count
    }
    
    func taskAt(index: Int) -> Task {
        return list[index]
    }
    
}

