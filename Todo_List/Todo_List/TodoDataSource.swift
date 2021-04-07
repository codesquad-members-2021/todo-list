//
//  TodoTableViewDataSource.swift
//  Todo_List
//
//  Created by 심영민 on 2021/04/06.
//

import UIKit

class TodoDataSource: NSObject, UITableViewDataSource {
    private var todoCards: [TodoCard] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1//todoCards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodoCell.identifier, for: indexPath) as? TodoCell else { return UITableViewCell() }
        cell.titleLabel.text = "ti"
        cell.contentLabel.text = "la"
        
        return cell
    }
}
