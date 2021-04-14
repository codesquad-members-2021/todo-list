//
//  Doing.swift
//  ToDoListApp
//
//  Created by zombietux on 2021/04/08.
//

import Foundation

class Doing: BoardManageable, CardFactory {
 
    private var board: Board
    private let title = "하고 있는 일"
    
    init(board: Board) {
        self.board = board
    }
    
    convenience init() {
        let board = Board()
        self.init(board: board)
    }
    
    func getBoard() -> Board {
        return self.board
    }
    
    func count() -> Int {
        return self.board.count()
    }
    
    func forEachCards(handler: (CardManageable) -> ()) {
        board.forEachCards { card in
            handler(card)
        }
    }
    
    func appendCard(_ card: CardManageable) {
        self.board.appendCard(card)
    }
    
    func getTitle() -> String {
        return self.title
    }
    
    func editCard(_ card: CardManageable, index: Int) {
        self.board.editCard(at: index, for: card)
    }
    
    static func makeBoard(cards: [CardManageable]) -> BoardManageable {
        return Doing(board: Board(cards: cards))
    }
}
