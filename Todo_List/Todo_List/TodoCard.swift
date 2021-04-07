//
//  TodoCard.swift
//  Todo_List
//
//  Created by Lia on 2021/04/06.
//

import Foundation

class TodoCard {
    
    private var title: String
    private var content: String
    
    init(title: String, content: String) {
        self.title = title
        self.content = content
    }
    
    convenience init() {
        let title = ""
        let content = ""
        self.init(title: title, content: content)
    }
    
    
}


