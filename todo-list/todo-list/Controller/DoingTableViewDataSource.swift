//
//  DoingTableViewDataSource.swift
//  todo-list
//
//  Created by sonjuhyeong on 2021/04/12.
//

import UIKit

class DoingTableViewDataSource: NSObject, UITableViewDataSource {
    
    var cardList: CardList?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardList?.doing.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! ToDoTableViewCell
        cell.titleLabel.text = cardList?.doing[indexPath.row].title
        cell.contentLabel.text = cardList?.doing[indexPath.row].contents
        return cell
    }
}
