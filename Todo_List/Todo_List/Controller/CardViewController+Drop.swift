//
//  TaskViewController+Drop.swift
//  Todo_List
//
//  Created by 박혜원 on 2021/04/09.
//

import UIKit

/*
extension CardViewController : UITableViewDropDelegate {
    
    /*테이블 이동 시 handling a drop in a table view. */
    func tableView(_ tableView: UITableView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UITableViewDropProposal {
        return UITableViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
    }
    
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
        let destinationIndexPath: IndexPath
        
        if let indexPath = coordinator.destinationIndexPath {
            destinationIndexPath = IndexPath(row: 0, section: indexPath.section)
            
        } else {
            destinationIndexPath = IndexPath(row: 0, section: tableView.numberOfSections)
        }
        
        /*선택된 카드를 삭제하기 위한 싱글톤 객체호출*/
        let cardManager = CardManager.shared
        self.board.remove(at: cardManager.indexPathSection, type: cardManager.getBoardType())
        
        for item in coordinator.items {
            item.dragItem.itemProvider.loadObject(ofClass: Card.self, completionHandler: { (card, error) in
                guard let card = card as? Card else {
                    return
                }
                switch tableView {
                case self.todo :
                    self.board.append(with: card, type: .todo, at: destinationIndexPath.section)
                case self.doing :
                    self.board.append(with: card, type: .doing, at: destinationIndexPath.section)
                case self.done :
                    self.board.append(with: card, type: .done, at: destinationIndexPath.section)
                default : break
                }
            })
        }
    }
}
*/
