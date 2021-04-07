//
//  Doing.swift
//  TODOList
//
//  Created by 양준혁 on 2021/04/07.
//

import Foundation

class Doing {
    private var cards: [Card]
    
    init() {
        self.cards = []
    }
    
    func add(title: String, content: String, author: String) {
        let newCard = Card(title: title, content: content, author: author)
        self.cards.append(newCard)
    }
    
    func delete(index: Int) {
        cards.remove(at: index)
    }
    
    func modify(index: Int, title: String, content: String) {
        cards[index].setTitle(with: title)
        cards[index].setContent(with: content)
    }
    
    func move(index: Int, to: Int) {
        
    }
}
