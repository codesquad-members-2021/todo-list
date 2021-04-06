//
//  ToDoUseCase.swift
//  ToDoListApp
//
//  Created by zombietux on 2021/04/06.
//

import Foundation

class ToDoUseCase: ToDoUseCasePort {
    private var toDo: ToDoManageable
//    private var toDoService: ToDoServicePort
//    private var toDoRepogitory:
    
    init(toDo: ToDoManageable) {
        self.toDo = toDo
    }
    
    func add(toDo: ToDoManageable) {
//        toDoService.add(toDo: toDo)
    }
    
    func edit(toDo: ToDoManageable) {
        
    }
    
    func delete(toDo: ToDoManageable) {
        
    }
    
    func goToDone(toDo: ToDoManageable) {
        
    }
}
