//
//  Cards.swift
//  Todo_List
//
//  Created by 박혜원 on 2021/04/12.
//

import Foundation

class Cards : Codable {
    var items = [Card]()
    
    var count : Int {
        get { return items.count }
    }
    
    func append(with card : Card, at position : Int = 0) {
        items.insert(card, at: position)
    }
    
    func remove(at index : Int) -> Card {
        return items.remove(at: index)
    }
}
