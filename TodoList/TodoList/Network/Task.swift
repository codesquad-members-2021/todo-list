//
//  Task.swift
//  TodoList
//
//  Created by Ador on 2021/04/08.
//

import Foundation

struct Task: Codable {
    var id: Int?
    let title: String
    let contents: String
    let category: TaskState
    var dateTime: Date?
    var order: Int?
    var isDeleted: Int? // var deleted: Bool?
    
    init(title: String, contents: String, category: TaskState) {
        self.title = title
        self.contents = contents
        self.category = category
    }
    
    func encode() -> Data? {
        let data = try? JSONEncoder().encode(self)
        return data
    }
}

enum TaskState: String, Codable {
    case todo = "TODO"
    case progress = "PROGRESS"
    case done = "DONE"
}
