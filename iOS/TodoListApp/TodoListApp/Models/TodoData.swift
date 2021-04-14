//
//  TodoData.swift
//  TodoListApp
//
//  Created by Song on 2021/04/08.
//

import Foundation

struct TodoData: Codable {
    let id: Int
    let title: String
    let contents: String
    let createDate: String
    let todo: Bool
    let doing: Bool
    let done: Bool
}
