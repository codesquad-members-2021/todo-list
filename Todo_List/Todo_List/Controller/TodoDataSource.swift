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
                cell.contentLabel.addLineSpacing()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    // 아래 함수를 구현해줘야 일단 UI에서 cell이 움직인다!
    // 같은 테이블뷰 내에서 cell이 움직이면 이 함수가 호출된다.
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        noti
//        let cell = self.todoCards.getCard(at: sourceIndexPath)
//        self.todoCards.removeCard(at: sourceIndexPath)
//        self.todoCards.insertCard(item: cell, at: destinationIndexPath)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    }
}


