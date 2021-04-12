//
//  ToDoUseCase.swift
//  ToDoListApp
//
//  Created by zombietux on 2021/04/06.
//

import Foundation
import Combine

class CardUseCase: CardUseCasePort {
  
    private var card: CardManageable
    private var toDo: BoardManageable
    private var doing: BoardManageable
    private var done: BoardManageable
    private var cardNetworkManager: CardNetworkManagerProtocol
    
    init(card: CardManageable, toDo: BoardManageable, doing: BoardManageable, done: BoardManageable, cardNetworkManager: CardNetworkManagerProtocol) {
        self.card = card
        self.toDo = toDo
        self.doing = doing
        self.done = done
        self.cardNetworkManager = cardNetworkManager
    }
    
    convenience init() {
        let card = Card()
        let toDo = ToDo()
        let doing = Doing()
        let done = Done()
        let cardNetworkManager = CardNetworkManager()
        self.init(card: card, toDo: toDo, doing: doing, done: done, cardNetworkManager: cardNetworkManager)
    }

    func get(state: State) -> AnyPublisher<[Card], Error> {
        return cardNetworkManager.getCards(state: state)
    }
 
    func add(title: String, contents: String) -> AnyPublisher<[Card], Error>  {
        return cardNetworkManager.postCards(title: title, contents: contents)
    }
    
    func myAdd() {
       
    }
    
    func edit() {
        
    }
    
    func delete() {
        
    }
    
    func goToDone() {
        
    }
}
