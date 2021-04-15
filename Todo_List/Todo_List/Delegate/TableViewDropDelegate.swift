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
        let destinationIndexPath: IndexPath
        
        if let indexPath = coordinator.destinationIndexPath {
            destinationIndexPath = IndexPath(row: 0, section: indexPath.section)
            
        } else {
            destinationIndexPath = IndexPath(row: 0, section: tableView.numberOfSections)
        }
        for item in coordinator.items {
            item.dragItem.itemProvider.loadObject(ofClass: Card.self, completionHandler: { (card, error) in
                
                let maxSize = self.dataSource?.cards.count ?? 0
                guard let card = card as? Card,
                      let id = card.id
                else {
                    return
                }
                
                let index : Int
                
                // destinationIndexPath.section가 boundary를 넘어간 경우
                if destinationIndexPath.section >= maxSize {
                    index = maxSize - 1
                } else {
                    index = destinationIndexPath.section
                }
                guard let nextId = self.dataSource?.cards.items[index].id else { return }
                self.dataSource?.cards.append(with: card, at: destinationIndexPath.section)
                CardAPIClient().patchCard(from: id, type: "\(self.cardType)", to: nextId)
                NotificationCenter.default.post(name: Cards.ListChanged, object: self.dataSource)
            })
        }
    }
}
