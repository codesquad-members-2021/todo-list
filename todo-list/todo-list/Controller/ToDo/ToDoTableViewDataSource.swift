//
//  WillDoTableViewDataSource.swift
//  todo-list
//
//  Created by sonjuhyeong on 2021/04/12.
//

import UIKit

class ToDoTableViewDataSource: NSObject, UITableViewDataSource {
    
    var cardManager: CardManager
    
    init(cardManager: CardManager) {
        self.cardManager = cardManager
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardManager.cardList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! ToDoTableViewCell
        cell.titleLabel.text = cardManager.cardList?[indexPath.row].title
        cell.contentLabel.text = cardManager.cardList?[indexPath.row].contents
        return cell
    }
}
