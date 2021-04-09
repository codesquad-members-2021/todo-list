//
//  TodoTableViewDropDelegate.swift
//  Todo_List
//
//  Created by 심영민 on 2021/04/09.
//

import UIKit

class TodoTableViewDropDelegate: NSObject, UITableViewDropDelegate {
    
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
        
        let destinationIndexPath: IndexPath
        print(coordinator.destinationIndexPath)
        if let indexPath = coordinator.destinationIndexPath {
            destinationIndexPath = indexPath
        } else {
            let section = tableView.numberOfSections - 1
            let row = tableView.numberOfRows(inSection: section)
            destinationIndexPath = IndexPath(row: row, section: section)
        }
        
        coordinator.session.loadObjects(ofClass: NSString.self) { items in
            
            let stringItems = items as! [String]
            
            var indexPaths = [IndexPath]()
            for (index, item) in stringItems.enumerated() {
                let indexPath = IndexPath(row: destinationIndexPath.row + index, section: destinationIndexPath.section)
                
                // 나의 카드클래스에 아이템 추가
                
                
                indexPaths.append(indexPath)
            }
            tableView.insertRows(at: indexPaths, with: .automatic)
        }
    }
    
//    func tableView(_ tableView: UITableView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UITableViewDropProposal {
//        var dropProposal = UITableViewDropProposal(operation: .cancel)
//        
//        guard session.items.count == 1 else {
//            return dropProposal
//        }
//        
//        if tableView.hasActiveDrag {
//            if tableView.isEditing {
//                // .move 움직인다. .forbidden 잔상 남아있고 실제 안움직인다.
//                // .forbidden 으로 하고 일정거리이상 움직이면 .move로 해야할듯?
//                dropProposal = UITableViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
//                print("")
//            }
//        }
//        else {
//            dropProposal = UITableViewDropProposal(operation: .copy, intent: .insertAtDestinationIndexPath)
//        }
//        return dropProposal
//    }
    
}
