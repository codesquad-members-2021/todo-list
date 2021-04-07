//
//  TodoCard.swift
//  Todo_List
//
//  Created by Lia on 2021/04/06.
//

import Foundation

class TodoCard {
    
    private(set) var title: String
    private(set) var content: String
    
    init(title: String, content: String) {
        self.title = title
        self.content = content
    }
    
    convenience init() {
        let title = "title"
        let content = "content"
        self.init(title: title, content: content)
    }
    
}


