//
//  TodoTableViewDragDelegate.swift
//  Todo_List
//
//  Created by 심영민 on 2021/04/09.
//

import UIKit

class TodoTableViewDragDelegate: NSObject, UITableViewDragDelegate {
    
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        print(session)
        return []
//        let provider = NSItemProvider(object: tableView.cellForRow(at: indexPath) as! NSItemProviderWriting)
//        let item = UIDragItem(itemProvider: provider)
//        return [item]
    }
    
}
