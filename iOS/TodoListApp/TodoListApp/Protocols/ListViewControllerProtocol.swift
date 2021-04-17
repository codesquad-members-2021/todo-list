//
//  ListViewControllerProtocol.swift
//  TodoListApp
//
//  Created by Song on 2021/04/08.
//

import Foundation

protocol ListViewControllerProtocol {
    func updateViewControllerTitle(with title: String)
    func filterCards(of category: String, from allCards: [Card])
    func refreshTableView()
}
