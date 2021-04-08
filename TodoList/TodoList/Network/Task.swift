//
//  Task.swift
//  TodoList
//
//  Created by Ador on 2021/04/08.
//

import Foundation

struct Task: Codable {
    let id: Int
    let title: String
    let contents: String
    let category: TaskState
    let dateTime: Date
    let order: Int
    let deleted: Bool
}

enum TaskState: String, Codable {
    case todo = "TODO"
    case progress = "PROGRESS"
    case done = "DONE"
}
