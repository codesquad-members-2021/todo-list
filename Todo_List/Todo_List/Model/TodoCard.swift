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
    private(set) var postTime: String
    private var user: User
    
    init(title: String, content: String, postTime: String, user: User) {
        self.title = title
        self.content = content
        self.postTime = postTime
        self.user = user
    }
    
    convenience init() {
        let title = "title"
        let content = "content"
        let postTime = "2021.04.08"
        let user = User()
        self.init(title: title, content: content, postTime: postTime, user: user)
    }
    
}


