//
//  ImportViewModel.swift
//  TODOList
//
//  Created by Issac on 2021/04/08.
//

import Foundation

class ChangeCardViewModel {
    private(set) var subject: Observable<String>
    private(set) var body: Observable<String>
    private var cardsNetworkCenter: CardsNetworkCenter
    
    var addCardHandler: ((Card) -> Void)?
    
    init(subject: String, body: String) {
        self.subject = Observable(value: subject)
        self.body = Observable(value: body)
        self.cardsNetworkCenter = CardsNetworkCenter()
    }
    
    convenience init() {
        self.init(subject: "", body: "")
        self.cardsNetworkCenter = CardsNetworkCenter()
    }
    
    func addCard(mode: SectionMode) {
        guard let title = subject.value else { return }
        guard let contents = body.value else { return }
        let card = CardFactory.makeCard(title: title, contents: contents, mode: mode)
        self.cardsNetworkCenter.postCards(card: card) { (card) in
            self.addCardHandler?(card)
        }
    }
    
    func deleteCard(card: Card) {
        //delete
    }
    
    func modifyCard(card: Card) {
        //modify
    }
    
}
