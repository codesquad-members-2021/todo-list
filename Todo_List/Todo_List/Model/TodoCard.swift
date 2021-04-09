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
    private(set) var date: String
    
    init(title: String, content: String, date: String) {
        self.title = title
        self.content = content
        self.date = date
    }
    
    convenience init() {
        let title = "title"
        let content = "content"
        let date = "2021.04.08"
        self.init(title: title, content: content, date: date)
    }
    
}


