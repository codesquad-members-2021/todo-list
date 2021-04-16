//
//  LogDataModel.swift
//  TodoList
//
//  Created by Jun Ho JANG on 2021/04/15.
//

import Foundation

struct LogModel {
    let log: [Log]
}

struct Log {
    let id: Int
    let title: String
    let fromStatus: String
    let toStatus: String?
    let action: String
    let createDataTime: String
}
