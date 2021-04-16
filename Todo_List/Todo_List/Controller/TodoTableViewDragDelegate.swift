//
//  TodoTableViewDragDelegate.swift
//  Todo_List
//
//  Created by 심영민 on 2021/04/09.
//

import UIKit

extension TodoTableViewController: UITableViewDragDelegate {
    
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let itemProvider = NSItemProvider()
        let dragItem = UIDragItem(itemProvider: itemProvider)
        dragItem.localObject = todoDataSource.todoCards[indexPath.row]
        
        return [dragItem]
    }    
}
