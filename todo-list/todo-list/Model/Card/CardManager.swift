//
//  CardManager.swift
//  todo-list
//
//  Created by Song on 2021/04/14.
//

import Foundation


class CardManager {
    
    private var categoryID: Int?
    private var cardList: [Card]?
    
    init() {
        self.categoryID = nil
        self.cardList = nil
    }
    
    //MARK: - CRUD Methods
    func configure(cardList: [Card], categoryID: Int) {
        self.categoryID = categoryID
        self.cardList = cardList
        
        postCountChange()
    }
    
    func add(card: Card) {
        if cardList != nil {
            cardList?.append(card)
        } else {
            cardList = [card]
        }
        postCountChange()
    }

    func delete(cardAtPosition position: Int) {
        self.cardList?.remove(at: position - 1)
        postCountChange()
    }
    
    func index(of cardID: Int) -> Int? {
        guard let cardList = cardList else { return nil }
        var targetIdx: Int?
        
        for (idx, card) in cardList.enumerated() {
            if card.cardId == cardID {
                targetIdx = idx
            }
        }
        return targetIdx
    }
    
    //MARK: - Notification
    private func postCountChange() {
        guard let count = count() else { return }
        
        let userInfo = ["count": count]
        
        NotificationCenter.default.post(name: NotiKeys.countChanged,
                                        object: self,
                                        userInfo: userInfo)
    }
    
    enum NotiKeys {
        static let countChanged = Notification.Name("countChanged")
        static let addCard = Notification.Name("addCard")
        static let deleteCard = Notification.Name("deleteCard")
        static let moveCard = Notification.Name("moveCard")
    }
}

extension CardManager: CardFindable {

    func count() -> Int? {
        return cardList?.count
    }
    
    func cardAt(index: Int) -> Card? {
        return cardList?[index]
    }
    
}

extension CardManager: CardAddable {
    
    func newCard(withTitle title: String, contents: String) {
        guard let categoryID = self.categoryID else { return }
        
        let newCard = AddCard(category: categoryID, title: title, contents: contents)
        NotificationCenter.default.post(name: NotiKeys.addCard, object: self, userInfo: ["addCard": newCard])
    }
    
}

extension CardManager: CardDeletable {
    
    func delete(cardAt index: Int) {
        guard let categoryID = categoryID else { return }
        
        let userInfo = ["category": categoryID, "cardID": index+1]
        NotificationCenter.default.post(name: NotiKeys.deleteCard, object: self, userInfo: userInfo)
    }

}

extension CardManager: CardMovable {
    
    func move(card: Card, toIndex: Int) {
        guard let categoryID = categoryID else { return }
        
        let userInfo: [String : Any] = ["card": card, "toCategory": categoryID, "toIndex": toIndex]
        NotificationCenter.default.post(name: NotiKeys.moveCard, object: self, userInfo: userInfo)
    }
    
    func moveToDone(card: Card, toIndex: Int) {
        let userInfo: [String : Any] = ["card": card, "toCategory": 3, "toIndex": toIndex]
        NotificationCenter.default.post(name: NotiKeys.moveCard, object: self, userInfo: userInfo)
    }

}
