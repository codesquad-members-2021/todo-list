//
//  Uitility.swift
//  ToDoListApp
//
//  Created by 지북 on 2021/04/08.
//

import Foundation

enum States: String {
    case ToDo = "ToDo"
    case InProgress = "InProgress"
    case Done = "Done"
}

enum NotificationUserInfoKey {
    static let sourceStates = "sourceStates"
}
