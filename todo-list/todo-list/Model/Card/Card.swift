//
//  Card.swift
//  todo-list
//
//  Created by sonjuhyeong on 2021/04/11.
//

import Foundation

struct Card: Codable{
    let cardId: Int
    let category: Int
    let title: String
    let contents: String
}

struct CardList: Codable {
    let categoryId: Int
    let cards: [Card]
}

struct CardData: Codable {
    let data: [CardList]
}

struct AddCard: Codable {
    let category: Int
    let title: String
    let contents: String
}

