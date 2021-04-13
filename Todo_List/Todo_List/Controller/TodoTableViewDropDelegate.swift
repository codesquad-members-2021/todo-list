//
//  TodoTableViewDropDelegate.swift
//  Todo_List
//
//  Created by 심영민 on 2021/04/09.
//

import UIKit

struct DragItem {
    var dataSource: TodoDataSource
    var indexPath: IndexPath
    var tableView: UITableView
    
}

extension TodoTableViewController: UITableViewDropDelegate {
    
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
        let destinationIndexPath: IndexPath
        
        if let indexPath = coordinator.destinationIndexPath {
            destinationIndexPath = indexPath
        } else {
            let section = tableView.numberOfSections - 1
            let row = tableView.numberOfRows(inSection: section)
            destinationIndexPath = IndexPath(row: row, section: section)
        }
        
        let item = coordinator.items.first!
        let dragItem = item.dragItem.localObject as! DragItem
        let data = dragItem.dataSource
        
        let card = data.todoCards.getCard(at: dragItem.indexPath)

        self.todoDataSource.todoCards.insertCard(item: card, at: destinationIndexPath) // 도착지 데이터 추가
        data.todoCards.removeCard(at: dragItem.indexPath) // 출발지 데이터 삭제
        
        dragItem.tableView.deleteRows(at: [dragItem.indexPath], with: .automatic) // 출발지 테이블 셀 삭제
        tableView.insertRows(at: [destinationIndexPath], with: .automatic) // 도착지 테이블 셀 추가
        
    }

}
