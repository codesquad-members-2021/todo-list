//
//  TodoCard.swift
//  Todo_List
//
//  Created by Lia on 2021/04/06.
//

import Foundation

struct User: Codable {
    var name: String
    var profileUrl: String
}

struct TodoCard: Codable {
    var id: Int
    var title: String
    var contents: String
    var postTime: String
    var user: User
}

struct CreateCard: Codable {
    var title: String
    var contents: String
    var status: String
}

struct MoveCard: Codable {
    var status: String
}

//GET
class TodoCards: Codable {
    var todo: [TodoCard] = []
    var doing: [TodoCard] = []
    var done: [TodoCard] = []
}

//POST
struct Decode: Codable {
    var id: Int
    var userId: Int
    var title: String
    var contents: String
    var status: String
    var postTime: String
}
