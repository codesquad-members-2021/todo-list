//
//  DropDelegate.swift
//  TodoList
//
//  Created by Ador on 2021/04/13.
//

import UIKit

class DoDropDelegate: NSObject, UITableViewDropDelegate {
    
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
        let destinationIndexPath: IndexPath
        guard let dragItems = coordinator.session.localDragSession?.items else {
            return
        }
        let localObjects = dragItems.compactMap {
            return $0.localObject as? Task
        }
        if let indexPath = coordinator.destinationIndexPath {
            destinationIndexPath = indexPath
        } else {
            destinationIndexPath = IndexPath(row: 0, section: 0)
        }
        
        localObjects.forEach {
            DoDTO.shared.insert(index: destinationIndexPath.section, task: $0)
            DoingDTO.shared.filter(task: $0)
            DoneDTO.shared.filter(task: $0)
        }
        NotificationCenter.default.post(name: .taskDropped, object: self)
    }
}

class DoingDropDelegate: NSObject, UITableViewDropDelegate {
    
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
        let destinationIndexPath: IndexPath
        guard let dragItems = coordinator.session.localDragSession?.items else {
            return
        }
        let localObjects = dragItems.compactMap {
            return $0.localObject as? Task
        }
        if let indexPath = coordinator.destinationIndexPath {
            destinationIndexPath = indexPath
        } else {
            destinationIndexPath = IndexPath(row: 0, section: 0)
        }
        
        localObjects.forEach {
            DoingDTO.shared.insert(index: destinationIndexPath.section, task: $0)
            DoDTO.shared.filter(task: $0)
            DoneDTO.shared.filter(task: $0)
        }
        NotificationCenter.default.post(name: .taskDropped, object: self)
    }
}

class DoneDropDelegate: NSObject, UITableViewDropDelegate {
    
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
        let destinationIndexPath: IndexPath
        guard let dragItems = coordinator.session.localDragSession?.items else {
            return
        }
        let localObjects = dragItems.compactMap {
            return $0.localObject as? Task
        }
        if let indexPath = coordinator.destinationIndexPath {
            destinationIndexPath = indexPath
        } else {
            destinationIndexPath = IndexPath(row: 0, section: 0)
        }
        
        localObjects.forEach {
            DoneDTO.shared.insert(index: destinationIndexPath.section, task: $0)
            DoDTO.shared.filter(task: $0)
            DoingDTO.shared.filter(task: $0)
        }
        NotificationCenter.default.post(name: .taskDropped, object: self)
    }
}
