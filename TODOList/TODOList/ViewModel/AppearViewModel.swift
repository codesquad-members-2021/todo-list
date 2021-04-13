//
//  WillTODOViewModel.swift
//  TODOList
//
//  Created by Issac on 2021/04/07.
//

import Foundation

class AppearViewModel {
    private(set) var cards: [Card] {
        didSet {
            self.passingData()
        }
    }
    
    private var mode: SectionMode
    var passingDataHandler: (([Card]) -> ())?
    var cardsNetworkCenter: CardsNetworkCenter
    
    init(mode: SectionMode) {
        self.mode = mode
        self.cardsNetworkCenter = CardsNetworkCenter()
        self.cards = [Card]()
        
        cardsNetworkCenter.getCards { (dict) in
            self.cards = dict[self.mode.rawValue, default: [Card]()]
        }
    }
    
    func frontEnqueue(card: Card) {
        self.cards.insert(card, at: 0)
    }
    
    private func passingData() {
        passingDataHandler?(cards)
    }
}
