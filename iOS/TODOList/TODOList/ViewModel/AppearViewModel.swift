//
//  WillTODOViewModel.swift
//  TODOList
//
//  Created by Issac on 2021/04/07.
//

import Foundation

protocol CardOutputViewModel {
    var cards: [Card] { get }
    var getDataHandler: (() -> ())? { get set }
    func frontEnqueue(card: Card)
    func insertCard(of card: Card, at index: Int)
}

class AppearViewModel: CardOutputViewModel {
    private(set) var cards: [Card]
    
    private var mode: SectionMode
    var getDataHandler: (() -> ())?
    var cardsNetworkCenter: NetworkingCards
    
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
        self.passingData()
    }
    
    func insertCard(of card: Card, at index: Int) {
        self.cards.insert(card, at: index)
    }
    
    private func passingData() {
        getDataHandler?()
    }
}
