//
//  TaskVO.swift
//  Todo_List
//
//  Created by 박혜원 on 2021/04/08.
//

import Foundation

class TaskVO {
    
    var id : Int?
    var title : String
    var content : String
    var writer : String
    var create : Date?
    
    init(title : String, content: String, writer : String){
        self.title = title
        self.content = content
        self.writer = writer
    }
    convenience init(){
        
        self.init(title : "iOS", content: "implements plus button", writer : "elly")
    }
}
