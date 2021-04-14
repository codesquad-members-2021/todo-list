//
//  DragDelegate.swift
//  TodoList
//
//  Created by Ador on 2021/04/13.
//

import UIKit

class DoDragDelegate: NSObject, UITableViewDragDelegate {
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let task = DoDTO.shared.configure(index: indexPath.section)
        let itemProvider = NSItemProvider()
        let dragItem = UIDragItem(itemProvider: itemProvider)
        dragItem.localObject = task
        return [dragItem]
    }
}

class DoingDragDelegate: NSObject, UITableViewDragDelegate {
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let task = DoingDTO.shared.configure(index: indexPath.section)
        let itemProvider = NSItemProvider()
        let dragItem = UIDragItem(itemProvider: itemProvider)
        dragItem.localObject = task
        return [dragItem]
    }
}

class DoneDragDelegate: NSObject, UITableViewDragDelegate {
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let task = DoneDTO.shared.configure(index: indexPath.section)
        let itemProvider = NSItemProvider()
        let dragItem = UIDragItem(itemProvider: itemProvider)
        dragItem.localObject = task
        return [dragItem]
    }
}
