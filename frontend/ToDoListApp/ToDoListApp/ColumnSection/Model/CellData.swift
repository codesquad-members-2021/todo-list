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
    
    init(title: String, content: String) { //tempinit
        self.cardId = 0
        self.title = title
        self.content = content
        self.isApp = false
        self.createdTime = ""
        self.position = 0
        setCaption()
    }
    
    func setCaption(){
        if !isApp {
            
        }
        else {
            
        }
    }
    
    func sendTitle() -> Void{
        let userInfo : [String : String] = ["cardData" : title]
        NotificationCenter.default.post(name: NSNotification.Name("abcd"), object: self, userInfo: userInfo)
    }
    
    func sendContent() -> Void{
        
    }
}
