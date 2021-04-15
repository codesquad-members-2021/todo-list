//
//  Interfaces.swift
//  todo-list
//
//  Created by Song on 2021/04/14.
//

import Foundation

protocol CardAddable {
    
    func newCard(withTitle title: String, contents: String) 
    
}

protocol CardFindable {
    
    func count() -> Int?
    
    func cardAt(index: Int) -> Card?
    
}

protocol CardDeletable {
    
    func delete(cardAt index: Int)
    
}
