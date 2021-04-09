//
//  TaskManager.swift
//  Todo_List
//
//  Created by 박혜원 on 2021/04/09.
//

import Foundation

class TaskVOManager {
    enum TaskType {
        case todo
        case doing
        case done
    }
    var todoList = [TaskVO]()
    var doingList = [TaskVO]()
    var doneList = [TaskVO]()
    
    func apepnd(with task : TaskVO, type : TaskVOManager.TaskType) {
        switch type {
        case .todo:
            todoList.insert(task, at: 0)
        case .doing:
            doingList.insert(task, at: 0)
        case .done:
            doneList.insert(task, at: 0)
        }
    }
    func remove(at index: Int, type : TaskVOManager.TaskType){
        switch type {
        case .todo:
            todoList.remove(at: index)
        case .doing:
            doingList.remove(at: index)
        case .done:
            doneList.remove(at: index)
        }
    }
}
