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
    var todoList = Cards()
    var doingList = Cards()
    var doneList = Cards()
    
    func append(with card : Card, type : Board.CardType, at position : Int = 0) {
        DispatchQueue.global().async {
            CardAPIClient().createCard(with: card)
        }
        switch type {
        case .todo:
            todoList.append(with: card, at: position)
            NotificationCenter.default.post(name: Board.TodoListChanged, object: self)
        case .doing:
            doingList.append(with: card, at: position)
            NotificationCenter.default.post(name: Board.DoingListChanged, object: self)
        case .done:
            doneList.append(with: card, at: position)
            NotificationCenter.default.post(name: Board.DoneListChanged, object: self)
        }
    }
    func remove(at index: Int, type : Board.CardType){
        let result : Card
        switch type {
        case .todo:
            result = todoList.remove(at: index)
            NotificationCenter.default.post(name: Board.TodoListChanged, object: self)
        case .doing:
            result = doingList.remove(at: index)
            NotificationCenter.default.post(name: Board.DoingListChanged, object: self)
        case .done:
            result = doneList.remove(at: index)
            NotificationCenter.default.post(name: Board.DoneListChanged, object: self)
        }
        DispatchQueue.global().async {
            CardAPIClient().deleteCard(with: result.id)
        }
    }
}
