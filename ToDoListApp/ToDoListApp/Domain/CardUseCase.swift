//
//  ToDoUseCase.swift
//  ToDoListApp
//
//  Created by zombietux on 2021/04/06.
//

import Foundation

class CardUseCase: CardUseCasePort {
    private var card: CardManageable
    
    init(card: CardManageable) {
        self.card = card
    }
    
    func get() -> [Board] {
        let boards = [
            Board(title: "해야할 일", cards:
                    [Card(id: 1, title: "헬스장 가기", contents: "- 런닝머신 30분", columnId: 1),
                     Card(id: 2, title: "코드스쿼드 가기", contents: "버스타고 가기", columnId: 1),
                     Card(id: 3, title: "맛집 가기", contents: "걸어서 가기", columnId: 1),
                     Card(id: 4, title: "여자친구에게 전화하기", contents: "하루에 3번", columnId: 1)
                    ]),
            
            Board(title: "하고 있는 일", cards:
                    [Card(id: 5, title: "ToDoListApp UI", contents: "넘나 어렵..", columnId: 2),
                     Card(id: 6, title: "Network Layer나누기", contents: "홍 파이팅!", columnId: 2),
                     Card(id: 7, title: "매일 기타 30분!", contents: "잊지말기", columnId: 2)
                    ]),
            
            Board(title: "완료한 일", cards:
                    [Card(id: 8, title: "코드스쿼드 iOS 배우기", contents: "힘들었다.", columnId: 3),
                    ]),
        ]
        
        return boards
    }
    
    func add() {

    }
    
    func edit() {
        
    }
    
    func delete() {
        
    }
    
    func goToDone() {
        
    }
}
