//
//  TodoCard.swift
//  Todo_List
//
//  Created by Lia on 2021/04/06.
//

import Foundation

struct User: Codable {
    var name: String
    var profileUrl: String
}

struct TodoCard: Codable {
    var title: String
    var contents: String
    var postTime: String
    var user: User
}


//GET
class TodoCards: Codable {
    var todo: [TodoCard]
    var doing: [TodoCard]
    var done: [TodoCard]
    
    init() {
        self.todo = []
        self.doing = []
        self.done = []
        
        loadNetwork()
    }
    
    func loadNetwork() {
        NetworkManager().perfomRequest(urlString: EndPoint.home.rawValue, httpMethod: .get, dataType: TodoCards.self) { [self] (result) in
            switch result {
            case .success(let data):
                let todoCards = data as? TodoCards
                self.todo = todoCards!.todo
                self.doing = todoCards!.doing
                self.done = todoCards!.done
                print("🥲", self.todo)
                NotificationCenter.default.post(name: NSNotification.Name("finishNetwork"), object: nil)
            case .failure(let error):
                print(error)
            }
        }
    }
}

//POST
struct decode {
    var id: Int
    var userId: Int
    var title: String
    var contents: String
    var status: String
    var postTime: String
}
