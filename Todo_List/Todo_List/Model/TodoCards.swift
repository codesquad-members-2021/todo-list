//
//  TodoCards.swift
//  Todo_List
//
//  Created by Lia on 2021/04/07.
//

import UIKit

protocol TodoCardsManageable {
    func getCard(at indexPath: IndexPath) -> TodoCard
    func countCards() -> Int
    func removeCard(at indexPath: IndexPath)
    func insertCard(item: TodoCard, at indexPath: IndexPath)
    func dragItems(for indexPath: IndexPath) -> [UIDragItem]
}


class TodoCards: TodoCardsManageable {
    
    private var cards: [TodoCard]
    
    init(cards: [TodoCard]) {
        self.cards = cards
    }
    
    convenience init() {
        let titleEX = "GitHub 공부하기"
        let contentEX = """
                    add, commit, push
                    * GitHub 공부 내용
                    * 모던 스위프트 공부 내용 1장
                    - JK 의 앵프라맹스
                    """
        let cardA = TodoCard(title: titleEX, content: contentEX, postTime: "", user: User())
        let cardB = TodoCard()
        let cards = [cardA, cardB]
        
        self.init(cards: cards)
    }
    
    func getCard(at indexPath: IndexPath) -> TodoCard {
        return cards[indexPath.item]
    }
    
    func countCards() -> Int {
        return cards.count
    }
    
    func removeCard(at indexPath: IndexPath) {
        cards.remove(at: indexPath.row)
    }
    
    func insertCard(item: TodoCard, at indexPath: IndexPath) {
        cards.insert(item, at: indexPath.row)
    }
    
    func dragItems(for indexPath: IndexPath) -> [UIDragItem] {
        let card = cards[indexPath.row]
        
        let itemProvider = NSItemProvider(object: card as! NSItemProviderWriting)
        return [UIDragItem(itemProvider: itemProvider)]
    }
    
    func canHandle(_ session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass: TodoCard.self)
    }
}



