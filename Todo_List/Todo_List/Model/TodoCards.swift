//
//  TodoCards.swift
//  Todo_List
//
//  Created by Lia on 2021/04/07.
//

import Foundation

protocol TodoCardsManageable {
    func getCard(at indexPath: IndexPath) -> TodoCard
    func countCards() -> Int
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
}



