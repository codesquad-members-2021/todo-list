//
//  ToDoUseCase.swift
//  ToDoListApp
//
//  Created by zombietux on 2021/04/06.
//

import Foundation

class CardUseCase: CardUseCasePort {
    private var card: CardManageable
    private var toDo: BoardManageable
    private var doing: BoardManageable
    private var done: BoardManageable
    
    init(card: CardManageable, toDo: BoardManageable, doing: BoardManageable, done: BoardManageable) {
        self.card = card
        self.toDo = toDo
        self.doing = doing
        self.done = done
    }
    
    convenience init() {
        let card = Card()
        let toDo = ToDo()
        let doing = Doing()
        let done = Done()
        self.init(card: card, toDo: toDo, doing: doing, done: done)
    }
    
    func get() -> [BoardManageable] {
        self.getToDoBoard()
        self.getDoingBoard()
        self.getDoneBoard()
        
        let boards: [BoardManageable] = [
            self.toDo, self.doing, self.done
        ]
        
        return boards
    }
    //테스트 메서드
    func getToDoBoard() {
        let response: Board = Board(cards: [Card(id: "1", title: "헬스장 가기", contents: "- 런닝머신 30분", columndId: 1),
                      Card(id: "2", title: "코드스쿼드 가기", contents: "버스타고 가기", columndId: 1),
                      Card(id: "3", title: "맛집 가기", contents: "걸어서 가기", columndId: 1),
                      Card(id: "4", title: "여자친구에게 전화하기", contents: "하루에 3번", columndId: 1)
        ])
        
        response.forEachCards { card in
            self.toDo.appendCard(card)
        }
    }
    
    func getDoingBoard() {
        let response: Board = Board(cards: [Card(id: "5", title: "ToDoListApp UI", contents: "넘나 어렵..", columndId: 2),
                                            Card(id: "6", title: "Network Layer나누기", contents: "홍 파이팅!", columndId: 2),
                                            Card(id: "7", title: "매일 기타 30분!", contents: "잊지말기", columndId: 2)
        ])
        
        response.forEachCards { card in
            self.doing.appendCard(card)
        }
    }
    
    func getDoneBoard() {
        let response: Board = Board(cards: [Card(id: "8", title: "코드스쿼드 iOS 배우기", contents: "힘들었다.", columndId: 3),
        ])
        
        response.forEachCards { card in
            self.done.appendCard(card)
        }
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
