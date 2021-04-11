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
    private var cardNetworkManager: CardNetworkManagerProtocol
    var bag = Set<AnyCancellable>()

    init(card: CardManageable) {
        self.card = card
        self.cardNetworkManager = CardNetworkManager()
    }
    
    func get(state: State) -> AnyPublisher<[Card], Error> {

        return cardNetworkManager.getCards(state: state)
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
