//
//  TodoDataSource.swift
//  Todo_List
//
//  Created by 심영민 on 2021/04/06.
//

import UIKit

class TodoDataSource: NSObject, UITableViewDataSource {
    private (set) var todoCards: TodoCardsManageable
    
    init(todoCards: TodoCardsManageable) {
        self.todoCards = todoCards
        super.init()
    }
    
    convenience override init() {
        self.init(todoCards: TodoCards())
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoCards.countCards()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodoCell.identifier, for: indexPath) as? TodoCell else { return UITableViewCell() }
        
        cell.titleLabel.text = todoCards.getCard(at: indexPath).title
        cell.contentLabel.text = todoCards.getCard(at: indexPath).content
        cell.contentLabel.addLineSpacing()
        
        return cell
    }
}


