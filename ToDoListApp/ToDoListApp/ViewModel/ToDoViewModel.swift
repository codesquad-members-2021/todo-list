//
//  ToDoViewModel.swift
//  ToDoListApp
//
//  Created by zombietux on 2021/04/07.
//

import Foundation

class ToDoViewModel {
    private var toDoUseCase: ToDoUseCasePort
    
    init(toDoUseCase: ToDoUseCasePort) {
        self.toDoUseCase = toDoUseCase
    }
    
    convenience init() {
        let toDoUseCase = ToDoUseCase(toDo: ToDo())
        self.init(toDoUseCase: toDoUseCase)
    }
    
    func get() -> [Board] {
        return toDoUseCase.get()
    }  
}
