//
//  Cards.swift
//  Todo_List
//
//  Created by 박혜원 on 2021/04/12.
//

import Foundation

class Cards : Codable {
    
    static let ListChanged = Notification.Name("ListChanged")
    
    var items = [Card]()
    
    var count : Int {
        get { return items.count }
    }
    
    func append(with card : Card, at position : Int = 0) {
        NotificationCenter.default.post(name: Cards.ListChanged, object : self)
        items.insert(card, at: position)
    }
    
    @discardableResult
    func remove(at index : Int) -> Card {
        NotificationCenter.default.post(name: Cards.ListChanged, object : self)
        return items.remove(at: index)
    }
}
