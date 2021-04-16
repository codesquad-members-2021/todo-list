//
//  LogDataModel.swift
//  TodoList
//
//  Created by Jun Ho JANG on 2021/04/15.
//

import Foundation

struct LogModel: Codable {
    let logs: [Log]
}

struct Log: Codable {
    let id: Int
    let title: String
    let fromStatus: String
    let toStatus: String?
    let action: String
    let createDateTime: String
}
