//
//  Cards.swift
//  Todo_List
//
//  Created by 박혜원 on 2021/04/12.
//

import Foundation

class Cards : Codable {
    var list = [Card]()
    
    var count : Int {
        get { return list.count }
    }
    
    func append(with card : Card, at position : Int = 0) {
        list.insert(card, at: position)
    }
    
    func remove(at index : Int) -> Card {
        return list.remove(at: index)
    }
}
