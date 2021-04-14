//
//  Activity.swift
//  TodoListApp
//
//  Created by Song on 2021/04/06.
//

import Foundation

class Activity {
    enum action {
        case add, remove, update, move
    }
    
    private let userAction: action
    private let occurredAt: Date
    
    init(userAction: action) {
        self.userAction = userAction
        self.occurredAt = Date()
    }
}
