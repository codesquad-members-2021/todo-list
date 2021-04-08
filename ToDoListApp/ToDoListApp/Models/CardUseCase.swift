//
//  ToDoUseCase.swift
//  ToDoListApp
//
//  Created by zombietux on 2021/04/06.
//

import Foundation

class CardUseCase: CardUseCasePort {
    private var card: CardManageable
    
    init(card: CardManageable) {
        self.card = card
    }
    
    func get() -> [Board] {
        let boards = [
            Board(title: "해야할 일", items: ["해야할 일1", "해야할 일2", "해야할 일3", "해야할 일4"]),
            Board(title: "하고 있는 일", items: ["하고 있는 일1", "하고 있는 일2", "하고 있는 일3", "하고 있는 일4"]),
            Board(title: "완료한 일", items: ["완료한 일1", "완료한 일2", "완료한 일3", "완료한 일4"])
        ]
        
        return boards
    }
    
    func add() {

    }
    
    func edit() {
        
    }
    
    func delete() {
        
    }
    
    func goToDone() {
        
    }
}
