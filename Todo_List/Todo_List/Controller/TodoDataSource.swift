//
//  TodoDataSource.swift
//  Todo_List
//
//  Created by 심영민 on 2021/04/06.
//

import UIKit

class TodoDataSource: NSObject, UITableViewDataSource {
    var todoCards: [TodoCard]
    
    init(todoCards: [TodoCard]) {
        self.todoCards = todoCards
        super.init()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoCards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodoCell.identifier, for: indexPath) as? TodoCell else { return UITableViewCell() }
        
        cell.titleLabel.text = todoCards[indexPath.row].title
        cell.contentLabel.text = todoCards[indexPath.row].contents
        cell.authorLabel.text = "Author by \(todoCards[indexPath.row].user.name)"
        cell.contentLabel.addLineSpacing()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            NotificationCenter.default.post(name: NSNotification.Name("removeCard"),
                                            object: nil,
                                            userInfo: ["cardNum": self.todoCards[indexPath.row].id])
        }
    }
}


