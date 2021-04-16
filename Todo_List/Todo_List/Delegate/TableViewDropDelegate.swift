//
//  TableViewDropDelegate.swift
//  Todo_List
//
//  Created by 박혜원 on 2021/04/14.
//

import UIKit

class TableViewDropDelegate: NSObject, UITableViewDropDelegate {
    
    var cardType : CardType
    var dataSource : TableViewDataSource?
    
    init(withDataSource data : TableViewDataSource, type : CardType){
        self.dataSource = data
        self.cardType = type
    }
    
    func tableView(_ tableView: UITableView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UITableViewDropProposal {
        return UITableViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
    }
    
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
        var destinationIndexPath: IndexPath
        
        if let indexPath = coordinator.destinationIndexPath {
            destinationIndexPath = IndexPath(row: 0, section: indexPath.section)
            if indexPath.row == 1 {
                destinationIndexPath = IndexPath(row: 0, section: indexPath.section + 1)
            }
        } else {
            destinationIndexPath = IndexPath(row: 0, section: tableView.numberOfSections)
        }
        
        for item in coordinator.items {
            item.dragItem.itemProvider.loadObject(ofClass: Card.self, completionHandler: { (card, error) in
                
                guard let card = card as? Card,
                      let id = card.id
                else {
                    return
                }
                self.dataSource?.cards.append(with: card, at: destinationIndexPath.section)
                
                let index = destinationIndexPath.section - 1
                
                // 맨 앞에 추가 되는 경우
                let previousId : Int
                if index == -1 {
                    previousId = index
                } else  { // 중간에 추가 되는 경우
                    guard let _previousId = self.dataSource?.cards.items[index].id else { return }
                    previousId = _previousId
                    
                    // 원래 자리에 추가되는 경우
                    if previousId == id { return }
                }
                CardAPIClient().patchCard(from: id, type: "\(self.cardType)", to: previousId)
                NotificationCenter.default.post(name: Cards.ListChanged, object: nil)
            })
        }
    }
}
