//
//  Card.swift
//  TODOList
//
//  Created by 양준혁 on 2021/04/07.
//

import Foundation

class Card {
    private var title: String
    private var content: String
    private var author: String
    
    init(title: String, content: String, author: String) {
        self.title = title
        self.content = content
        self.author = author
    }
    
    func setTitle(with title: String) {
        self.title = title
    }
    
    func setContent(with content: String) {
        self.content = content
    }
    
}

extension Card: Equatable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.title == rhs.title && lhs.author == rhs.author && lhs.content == rhs.content
    }
}
