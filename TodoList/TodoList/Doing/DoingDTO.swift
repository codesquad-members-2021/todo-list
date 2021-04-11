//
//  DoingDTO.swift
//  TodoList
//
//  Created by Ador on 2021/04/11.
//

import Foundation

class DoingDTO {
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
}
