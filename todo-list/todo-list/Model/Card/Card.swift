//
//  Card.swift
//  todo-list
//
//  Created by sonjuhyeong on 2021/04/11.
//

import Foundation

struct Card: Codable, Equatable {
    let cardId: Int
    let category: Int
    let title: String
    let contents: String
    
    static func ==(lhs: Card, rhs: Card) -> Bool{
        return lhs.cardId == rhs.cardId
    }
}

struct CardList: Codable {
    let categoryId: Int
    let cards: [Card]
}

struct PostCard: Codable {
    let status: String
    let data: Card
}

struct CardData: Codable {
    let data: [CardList]
}

struct AddCard: Codable {
    let category: Int
    let title: String
    let contents: String
}

