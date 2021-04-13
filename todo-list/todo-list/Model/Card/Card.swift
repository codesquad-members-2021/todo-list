//
//  Card.swift
//  todo-list
//
//  Created by sonjuhyeong on 2021/04/11.
//

import Foundation

struct Card: Codable {
    let id: Int
    let title: String
    let contents: String
    let createDateTime: String
    let status: String
}

struct CardList: Codable {
    let todo: [Card]
    let doing: [Card]
    let done: [Card]
}


class CardManager {
    
    var cardList: [Card]?
    
    init() {
        self.cardList = nil
    }
    
    func update(cardList: [Card]) {
        self.cardList = cardList
    }
}
