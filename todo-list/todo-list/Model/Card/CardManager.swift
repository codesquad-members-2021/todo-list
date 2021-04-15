//
//  CardManager.swift
//  todo-list
//
//  Created by Song on 2021/04/14.
//

import Foundation

protocol CardAddable {
    
    func add(card: Card)
    
    func newCard(withTitle title: String, contents: String) 
    
}

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
    
    //MARK: - TableView Datasource Methods
    func count() -> Int? {
        return cardList?.count
    }
    
    func cardAt(index: Int) -> Card? {
        return cardList?[index]
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
    
    func newCard(withTitle title: String, contents: String) {
        guard let categoryID = self.categoryID else { return }
        
        let newCard = AddCard(category: categoryID, title: title, contents: contents)
        NotificationCenter.default.post(name: NotiKeys.addCard, object: self, userInfo: ["addCard": newCard])
    }
}
