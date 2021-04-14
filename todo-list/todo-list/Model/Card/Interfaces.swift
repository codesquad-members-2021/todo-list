//
//  Interfaces.swift
//  todo-list
//
//  Created by Song on 2021/04/14.
//

import Foundation

protocol CardAddable {
    
    func add(card: Card)
    
    func newCard(withTitle title: String, contents: String) -> AddCard?
    
}

protocol CardFindable {
    
    func count() -> Int?
    
    func cardAt(index: Int) -> Card?
    
}
