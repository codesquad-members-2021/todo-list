//
//  TaskVO.swift
//  Todo_List
//
//  Created by 박혜원 on 2021/04/08.
//

import Foundation

struct Card : Decodable {
    
    var id : Int?
    var title : String
    var content : String
    var writer : String
//    var create : Date?
    
    var deleted : Bool?
    var previousId : Int?
    
    
    init(title : String, content: String, writer : String){
        self.title = title
        self.content = content
        self.writer = writer
    }
    init(){
        self.init(title : "iOS",
                  content: "implements plus button with jackson in codesquad. test code for content line. Am I right?",
                  writer : "elly")
    }
}
