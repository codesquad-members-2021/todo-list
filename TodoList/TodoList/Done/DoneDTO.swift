//
//  DoneDTO.swift
//  TodoList
//
//  Created by Ador on 2021/04/11.
//

import Foundation

class DoneDTO {
    static let shared = DoneDTO()
    
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
    
    func insert(task: Task) {
        tasks.insert(task, at: 0)
    }
    
    func delete(index: Int) {
        tasks.remove(at: index)
    }
    
    func insert(index: Int, task: Task) {
        tasks.insert(task, at: index)
    }
    
    func filter(task: Task) {
        tasks = tasks.filter {
            return $0 != task
        }
    }
}
