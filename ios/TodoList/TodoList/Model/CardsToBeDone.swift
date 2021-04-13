//
//  CardToBeDone.swift
//  TodoList
//
//  Created by 조중윤 on 2021/04/07.
//

import Foundation

class CardsToBeDone: ToDoCardProtocol {
    var list: [ToDoItem]
    
    init() {
        self.list = []
    }
    
    func insertCard(newCard: ToDoItem, at order: Int) {
        self.list.insert(newCard, at: order)
    }
    
    func deleteCard(at index: Int) {
        self.list.remove(at: index)
    }
    
    func moveCard(at sourceIndex: Int, to destinationIndex: Int) {
        guard sourceIndex != destinationIndex else { return }
        
        let place = list[sourceIndex]
        list.remove(at: sourceIndex)
        list.insert(place, at: destinationIndex)
    }
    
//    func amendCard(with newTitle: String, at index: Int) {
//        self.list[index].amend(newTitle: newTitle)
//    }
}
