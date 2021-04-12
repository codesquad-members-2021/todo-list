//
//  DoDTO.swift
//  TodoList
//
//  Created by Ador on 2021/04/11.
//

import Foundation

class DoDTO {
    private var tasks: [Task]
    
    init() {
        self.tasks = []
    }
    
    func count() -> Int {
        return tasks.count
    }
    
    func configure(index: Int) -> Task {
        return tasks[index]
    }
    
    func update(tasks: [Task]) {
        self.tasks = tasks
    }
    
    func move(index: Int) -> Task {
        var task = tasks[index]
        task.category = TaskState.done
        return task
    }
    
    func delete(index: Int) {
        tasks.remove(at: index)
    }
}
