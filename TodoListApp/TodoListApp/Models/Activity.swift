//
//  Activity.swift
//  TodoListApp
//
//  Created by Song on 2021/04/06.
//

import Foundation

class Activity {
    enum action {
        // yj: 0, 1, 2, 3으로 구분?
        case add, remove, update, move
    }
    
    private let userAction: action
    // userAction 별로 달라지는 keyword 어떻게 처리?
    //private let actionKeywords: [String]
    private let occurredAt: Date
    
    init(userAction: action) {
        self.userAction = userAction
        self.occurredAt = Date()
    }
}
