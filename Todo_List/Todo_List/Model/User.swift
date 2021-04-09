//
//  User.swift
//  Todo_List
//
//  Created by Lia on 2021/04/08.
//

import Foundation

class User {
    
    private var name: String
    private var profileURL: String
    
    init(name: String, url: String) {
        self.name = name
        self.profileURL = url
    }
    
    convenience init() {
        let name = "name"
        let url = "http"
        
        self.init(name: name, url: url)
    }
    
}
