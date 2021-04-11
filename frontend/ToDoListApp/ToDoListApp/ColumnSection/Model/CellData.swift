//
//  CellData.swift
//  ToDoListApp
//
//  Created by 박정하 on 2021/04/07.
//

import Foundation

class CellData : Codable {
    
    var cardId : Int
    var title : String
    var content: String
    var isApp : Bool // need Computed?
    var createdTime : String
    var position: Int
    
    init() { //tempinit
        self.cardId = 0
        self.title = ""
        self.content = ""
        self.isApp = false
        self.createdTime = ""
        self.position = 0
    }
    
    func set(Title : String){
        self.title = Title
    }
    
    func set(Content : String){
        self.content = Content
    }
    
    func setCaption(){
        if !isApp {
            
        }
        else {
            
        }
    }
}
