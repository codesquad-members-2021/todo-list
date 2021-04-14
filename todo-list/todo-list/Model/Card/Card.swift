//
//  Card.swift
//  todo-list
//
//  Created by sonjuhyeong on 2021/04/11.
//

import Foundation

struct Card: Codable{
    let id: Int
    let vertical: Int
    let title: String
    let contents: String
    //let flag: Float
}

struct AddCard: Codable {
    let vertical: Int
    let title: String
    let contents: String
}

struct CardList: Codable {
    let id: Int
    let status: String
    let todos: [Card]
}
