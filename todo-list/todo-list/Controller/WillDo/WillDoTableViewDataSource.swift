//
//  WillDoTableViewDataSource.swift
//  todo-list
//
//  Created by sonjuhyeong on 2021/04/12.
//

import UIKit

class WillDoTableViewDataSource: NSObject, UITableViewDataSource {
    
    var cardList: CardList?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cardList?.todo.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! ToDoTableViewCell
        cell.titleLabel.text = cardList?.todo[indexPath.section].title
        cell.contentLabel.text = cardList?.todo[indexPath.section].contents
        return cell
    }
}
