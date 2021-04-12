//
//  Cards.swift
//  Todo_List
//
//  Created by 박혜원 on 2021/04/12.
//

import Foundation

class Cards : Decodable {
    var list = [Card]()
    
    var count : Int {
        get { return list.count }
    }
    
    func apepnd(with card : Card) {
        list.insert(card, at: 0)
    }
    func remove(at index : Int){
        list.remove(at: index)
    }
}
