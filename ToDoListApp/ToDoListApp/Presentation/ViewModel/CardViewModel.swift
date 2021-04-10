//
//  ToDoViewModel.swift
//  ToDoListApp
//
//  Created by zombietux on 2021/04/07.
//

import Foundation

class CardViewModel {
    private var cardUseCase: CardUseCasePort
    
    init(cardUseCase: CardUseCasePort) {
        self.cardUseCase = cardUseCase
    }
    
    convenience init() {
        let cardUseCase = CardUseCase()
        self.init(cardUseCase: cardUseCase)
    }
    
    func get() -> [BoardManageable] {
        return cardUseCase.get()
    }  
}
