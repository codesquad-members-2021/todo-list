//
//  Card.swift
//  ToDoList
//
//  Created by 오킹 on 2021/04/08.
//

import Foundation

struct Card: Codable, CustomStringConvertible {
    let id: Int
    let title: String
    let contents: String
    let status: String
    let createdTime: String
    let columnId: Int
}

extension CustomStringConvertible where Self: Codable {
    var description: String {
        var description = "\n \(type(of: self)) \n"
        let selfMirror = Mirror(reflecting: self)
        for child in selfMirror.children {
            if let propertyName = child.label {
                description += "\(propertyName): \(child.value)\n"
            }
        }
        return description
    }
}
