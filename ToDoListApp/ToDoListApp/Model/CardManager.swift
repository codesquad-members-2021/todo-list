//
//  CardManager.swift
//  ToDoListApp
//
//  Created by 지북 on 2021/04/08.
//

import Foundation

protocol CardManageDelegate {
    func count(states: States) -> Int
    func setCell(states: States, index: Int, handler: (Card)->())
    func add(card: Card)
}

class CardManager: CardManageDelegate {
    
    var cardDic: Dictionary<States, [Card]>
    
    init() {
        self.cardDic = [:]
        self.cardDic[.ToDo] = [Card(title: "코드스쿼드가기", body: "오늘은비모랑 코드스쿼드 가는날~", author: "iOS", states: .ToDo),Card(title: "빡공하기", body: "오늘은 비모랑 빡공하는날~~", author: "iOS", states: .ToDo)]
        self.cardDic[.InProgress] = [Card(title: "열심히 프로그래밍하기", body: "오늘하루도 화이팅", author: "iOS", states: .InProgress)]
        self.cardDic[.Done] = [Card(title: "우아아아이이", body: "우어어어어", author: "iOS", states: .ToDo)]
    }
    
    func count(states: States) -> Int {
        return self.cardDic[states]?.count ?? 0
    }
    
    func setCell(states:States, index: Int, handler: (Card) -> ()) {
        guard let cards = cardDic[states], !cards.isEmpty else {
            return
        }
        let count = cards.count - 1
        handler(cards[count - index])
    }
    
    func add(card: Card) {
        self.cardDic[card.states]?.append(card)
    }
}
