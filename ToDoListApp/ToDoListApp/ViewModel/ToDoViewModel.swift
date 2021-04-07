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
    
    func setSectionTitle(_ title: String) {
        self.toDoUseCase.setSectionTitle(title)
    }
}
