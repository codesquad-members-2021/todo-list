//
//  ToDoCardProtocol.swift
//  TodoList
//
//  Created by 조중윤 on 2021/04/07.
//

import Foundation

protocol ToDoCardProtocol {
    var cards: [ToDoCard] {get set}
    func insertCard(newCard: ToDoCard, at order: Int)
    func deleteCard(at index: Int)
    func moveCard(at sourceIndex: Int, to destinationIndex: Int)
    func amendCard(with newTitle: String, at index: Int)
}
