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
    func remove(states: States, at index: Int)
}

class CardManager: CardManageDelegate {

    var cardDic: Dictionary<States, [Card]>
    
    static let shared = CardManager()
    
    private init() {
        self.cardDic = [:]
        self.cardDic[.ToDo] = [Card(title: "코드스쿼드가기", body: "오늘은비모랑 코드스쿼드 가는날~", author: "iOS", states: .ToDo),Card(title: "빡공하기", body: "오늘은 비모랑 빡공하는날~~", author: "iOS", states: .ToDo)]
        self.cardDic[.InProgress] = [Card(title: "열심히 프로그래밍하기", body: "오늘하루도 화이팅", author: "iOS", states: .InProgress)]
        self.cardDic[.Done] = [Card(title: "우아아아이이", body: "우어어어어", author: "iOS", states: .Done)]
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
        NotificationCenter.default.post(name: CardManager.changeCardCount, object: self, userInfo: [NotificationUserInfoKey.sourceStates:card.states])
    }
    
    func remove(states: States, at index: Int) {
        self.cardDic[states]!.remove(at: index)
        NotificationCenter.default.post(name: CardManager.changeCardCount, object: self, userInfo: [NotificationUserInfoKey.sourceStates:states])
    }
    
    func insert(at index: Int, card: Card) {
        self.cardDic[card.states]?.insert(card, at: index)
        NotificationCenter.default.post(name: CardManager.changeCardCount, object: self, userInfo: [NotificationUserInfoKey.sourceStates:card.states])
    }
    
    func getCard(states: States, at index: Int) -> Card {
        guard let cards = cardDic[states] else {
            return Card(title: "", body: "", author: "", states: .InProgress)
        }
        return cards[index]
    }
    
    func moveCard(draggedCard: DraggedCard, destinationIndexPath: IndexPath, destinationIdentifier: States) {
        let card = draggedCard.cardInfo
        let sourceIndex = ReverseIndex.get(with: draggedCard.index, total: self.count(states: card.states))
        let sourceState = card.states

        let destinationIndex = ReverseIndex.get(with: destinationIndexPath.section, total: self.count(states: destinationIdentifier) + 1)

        card.states = destinationIdentifier
        
        self.remove(states: sourceState, at: sourceIndex)
        self.insert(at: destinationIndex, card: card)

        NotificationCenter.default.post(name: CardManager.cardMove, object: self, userInfo: [NotificationUserInfoKey.sourceStates:sourceState])
    }
}

extension CardManager {
    static let changeCardCount = Notification.Name("changeCardCount")
    static let cardMove = Notification.Name("cardMove")
}
