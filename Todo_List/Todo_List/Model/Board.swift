//
//  TaskManager.swift
//  Todo_List
//
//  Created by 박혜원 on 2021/04/09.
//

import Foundation

class Board {
    enum CardType {
        case todo
        case doing
        case done
    }
    var todoList = [Card]()
    var doingList = [Card]()
    var doneList = [Card]()
    
    func apepnd(with card : Card, type : Board.CardType) {
        switch type {
        case .todo:
            todoList.insert(card, at: 0)
        case .doing:
            doingList.insert(card, at: 0)
        case .done:
            doneList.insert(card, at: 0)
        }
    }
    func remove(at index: Int, type : Board.CardType){
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
