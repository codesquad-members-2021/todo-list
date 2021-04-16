//
//  TableViewDragDelegate.swift
//  Todo_List
//
//  Created by 박혜원 on 2021/04/14.
//

import UIKit


class TableViewDragDelegate: NSObject, UITableViewDragDelegate {

    var dataSource : TableViewDataSource?
    
    init(withDataSource data : TableViewDataSource){
        self.dataSource = data
    }

    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        guard let cardInfo = dataSource?.cards.items[indexPath.section].copy() as? Card else {
            return []
        }
        let itemProvider = NSItemProvider(object: cardInfo)
        let dragItem = UIDragItem(itemProvider: itemProvider)
        
        self.dataSource?.cards.remove(at: indexPath.section)
        return [dragItem]
    }
}

