//
//  ToDoUseCasePort.swift
//  ToDoListApp
//
//  Created by zombietux on 2021/04/06.
//

import Foundation

protocol ToDoManageable {
    func add(toDo: ToDo)
    func edit(toDo: ToDo)
    func delete(toDo: ToDo)
    func goToDone(toDo: ToDo)
}

protocol ToDoUseCasePort {
    func add(toDo: ToDoManageable)
    func edit(toDo: ToDoManageable)
    func delete(toDo: ToDoManageable)
    func goToDone(toDo: ToDoManageable)
    func get() -> [Board]
}
