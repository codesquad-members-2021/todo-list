//
//  TodoTableViewDropDelegate.swift
//  Todo_List
//
//  Created by 심영민 on 2021/04/09.
//

import UIKit

extension TodoTableViewController: UITableViewDropDelegate {
    
//    func tableView(_ tableView: UITableView, canHandle session: UIDropSession) -> Bool {
//        return todoDataSource.todoCards.canHandle(session)
//    }
    
    // drop이 일어날 경우 실제 update가 일어난다.
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
        
        // 해당함수는 같은 칼럼에서 drop이 일어날경우 호출되지않는다 해당함수는
        let destinationIndexPath: IndexPath
        
        if let indexPath = coordinator.destinationIndexPath {
            destinationIndexPath = indexPath
            print(destinationIndexPath)
            
        } else {
            // 칼럼이 넘어가고 row또한 넘어갔을때 else로 들어간다.
            let section = tableView.numberOfSections - 1
            let row = tableView.numberOfRows(inSection: section)
            destinationIndexPath = IndexPath(row: row, section: section)
        }
        guard let draggedItems = coordinator.session.localDragSession?.items else {
            return
        }
        let localObjects = draggedItems.compactMap({
            return $0.localObject as? TodoCard
        })
        
        var indexPaths = [IndexPath]()
        
        for (index, item) in localObjects.enumerated() {
            let indexPath = IndexPath(row: destinationIndexPath.row,
                                      section: destinationIndexPath.section)
            todoDataSource.todoCards.insertCard(item: item, at: indexPath)
            indexPaths.append(indexPath)
        }
        tableView.insertRows(at: indexPaths, with: .automatic)
        
        
//
//        coordinator.session.loadObjects(ofClass: TodoCard.self) { items in
//            // 아무것도 없네 items 에
//
//            let stringItems = items as! [TodoCard]
//
//            var indexPaths = [IndexPath]()
//            for (index, item) in stringItems.enumerated() {
//                let indexPath = IndexPath(row: destinationIndexPath.row + index, section: destinationIndexPath.section)
//
//                // 나의 카드클래스에 아이템 추가
//                todoDataSource.todoCards.insertCard(item: <#T##TodoCard#>, at: <#T##IndexPath#>)
//
//                indexPaths.append(indexPath)
//            }
//            tableView.insertRows(at: indexPaths, with: .automatic)
//        }
    }
    
// 이함수 넣으니까 row끼리도 안바뀌네?
//
    func tableView(_ tableView: UITableView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UITableViewDropProposal {
        var dropProposal = UITableViewDropProposal(operation: .cancel)

        guard session.items.count == 1 else {
            return dropProposal
        }
          //지금 현재 나의 제스쳐 위치가 tableview 안에 있으면 move 로 움직인다.
        if tableView.hasActiveDrag {
            if tableView.isEditing {
                // .move 움직인다. .forbidden 잔상 남아있고 실제 안움직인다.
                // .forbidden 으로 하고 일정거리이상 움직이면 .move로 해야할듯?
                dropProposal = UITableViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
                print("")
            }
        }
    //tableview안에 있지 않다면 copy가 일어난다. (잔상이 남아있고 + 버튼이 생긴다. 다른앱간의 move)
        else {
            dropProposal = UITableViewDropProposal(operation: .copy, intent: .insertAtDestinationIndexPath)
        }
        return dropProposal
    }
}
