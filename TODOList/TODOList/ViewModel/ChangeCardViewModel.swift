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
    private 
    
    init(subject: String, body: String) {
        self.subject = Observable(value: subject)
        self.body = Observable(value: body)
    }
    
    convenience init() {
        self.init(subject: "", body: "")
    }
    
    func addCard(mode: SectionMode) {
        guard let title = subject.value else { return }
        guard let contents = body.value else { return }
        let card = CardFactory.makeCard(title: title, contents: contents, mode: mode)
        
    }
    
    func deleteCard(card: Card) {
        //delete
    }
    
}
