//
//  TaskManager.swift
//  Todo_List
//
//  Created by 박혜원 on 2021/04/09.
//

import Foundation

class Board {
    
    static let TodoListChanged = Notification.Name("TodoListChanged")
    static let DoingListChanged = Notification.Name("DoingListChanged")
    static let DoneListChanged = Notification.Name("DoneListChanged")
    
    enum CardType : Int {
        case todo = 0
        case doing
        case done
    }
    var todoList = [Card]()
    var doingList = [Card]()
    var doneList = [Card]()
    
    func append(with card : Card, type : Board.CardType) {
        switch type {
        case .todo:
            todoList.insert(card, at: 0)
            NotificationCenter.default.post(name: Board.TodoListChanged, object: self)
        case .doing:
            doingList.insert(card, at: 0)
            NotificationCenter.default.post(name: Board.DoingListChanged, object: self)
        case .done:
            doneList.insert(card, at: 0)
            NotificationCenter.default.post(name: Board.DoneListChanged, object: self)
        }
    }
    func remove(at index: Int, type : Board.CardType){
        switch type {
        case .todo:
            todoList.remove(at: index)
            NotificationCenter.default.post(name: Board.TodoListChanged, object: self)
        case .doing:
            doingList.remove(at: index)
            NotificationCenter.default.post(name: Board.DoingListChanged, object: self)
        case .done:
            doneList.remove(at: index)
            NotificationCenter.default.post(name: Board.DoneListChanged, object: self)
        }
    }
}
