//
//  ToDoTableViewDragDropDelegate.swift
//  ToDoListApp
//
//  Created by 지북 on 2021/04/14.
//

import Foundation
import UIKit

class ToDoTableViewDragDropDelegate: NSObject, UITableViewDragDelegate {
    var cardManager = CardManager.shared
    var identifier: States
    
    init(identifier: States) {
        self.identifier = identifier
    }
    
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let itemProvier = NSItemProvider()
        let dragItem = UIDragItem(itemProvider: itemProvier)
        
        cardManager.setCell(states: identifier, index: indexPath.section, handler: { card in
            dragItem.localObject = DraggedCard(cardInfo: card, index: indexPath.section)
        })
        return [dragItem]
    }
}

extension ToDoTableViewDragDropDelegate: UITableViewDropDelegate {
    func tableView(_ tableView: UITableView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UITableViewDropProposal {
        if tableView.hasActiveDrag {
            if session.items.count > 1 {
                return UITableViewDropProposal(operation: .cancel)
            } else {
                return UITableViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
            }
        } else {
            return UITableViewDropProposal(operation: .copy, intent: .insertAtDestinationIndexPath)
        }
    }
    
    
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
        let destinationIndexPath: IndexPath
        
        if let indexPath = coordinator.destinationIndexPath {
            destinationIndexPath = indexPath
        } else {
            let section = tableView.numberOfSections
            destinationIndexPath = IndexPath(row: 0, section: section)
        }
        
    
        
        for item in coordinator.items {
            if let sourceIntePath = item.sourceIndexPath {
                tableView.beginUpdates()
                self.moveItem(at: sourceIntePath.section, to: destinationIndexPath.section)
                tableView.endUpdates()
                
                tableView.reloadData()
            } else if let draggedCard = item.dragItem.localObject as? DraggedCard {
                cardManager.moveCard(draggedCard: draggedCard, destinationIndexPath: destinationIndexPath, destinationIdentifier: identifier)
                tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, canHandle session: UIDropSession) -> Bool {
        return true
    }
    
    func moveItem(at sourceIndex: Int, to destinationIndex: Int) {
        let srcIndex = cardManager.count(states: identifier) - 1 - sourceIndex
        let dstIndex = cardManager.count(states: identifier) - 1 - destinationIndex
        let card = cardManager.getCard(states: identifier, at: srcIndex)
        
        cardManager.remove(states: identifier, at: srcIndex)
        cardManager.insert(at: dstIndex, card: card)
    }
}
