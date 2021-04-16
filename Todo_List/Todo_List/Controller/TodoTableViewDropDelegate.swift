//
//  TodoTableViewDropDelegate.swift
//  Todo_List
//
//  Created by 심영민 on 2021/04/09.
//

import UIKit

extension TodoTableViewController: UITableViewDropDelegate {
    
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
        
        let item = coordinator.items.first!
        let dragItem = item.dragItem.localObject as! TodoCard
        
        let userInfo: [String: Any] = ["card": dragItem, "column": self.column ?? ""]
        NotificationCenter.default.post(name: .moveCard, object: nil, userInfo: userInfo)
    }   

}
