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
    
    func add(card: Card) {
        if cardList != nil {
            cardList?.append(card)
        } else {
            cardList = [card]
        }
        postCountChange()
    }
    
    func newCard(withTitle title: String, contents: String) -> AddCard? {
        guard let categoryID = self.categoryID else { return nil }
        
        let newCard = AddCard(vertical: categoryID, title: title, contents: contents)
        return newCard
    }
}
