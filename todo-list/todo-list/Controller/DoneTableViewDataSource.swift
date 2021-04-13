//
//  DoneTableViewDataSource.swift
//  todo-list
//
//  Created by sonjuhyeong on 2021/04/12.
//

import UIKit

class DoneTableViewDataSource: NSObject, UITableViewDataSource {
    
    var cardList: CardList?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardList?.done.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! ToDoTableViewCell
        cell.titleLabel.text = cardList?.done[indexPath.row].title
        cell.contentLabel.text = cardList?.done[indexPath.row].contents
        return cell
    }
}
