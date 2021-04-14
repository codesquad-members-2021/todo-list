//
//  ToDoTableViewDropDelegate.swift
//  todo-list
//
//  Created by Song on 2021/04/14.
//

import UIKit

class ToDoTableViewDropDelegate: NSObject, UITableViewDropDelegate {
    
    private let cardSearcher: CardFindable
    
    init(cardSearcher: CardFindable) {
        self.cardSearcher = cardSearcher
    }
    
    func tableView(_ tableView: UITableView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UITableViewDropProposal {
        guard session.items.count == 1 else {
            return UITableViewDropProposal(operation: .forbidden)
        }
        return UITableViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
    }
    
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
        
        guard let lastIndex = cardSearcher.count() else { return }
        let destinationIndex = coordinator.destinationIndexPath?.section ?? lastIndex

        coordinator.session.loadObjects(ofClass: NSString.self) { items in
            if let cardInString = items[0] as? String,
               let cardInData = cardInString.data(using: .utf8),
               let card = ParsingManager.decodeData(type: Card.self, data: cardInData) {
                //원래 카드: card
                //옮기려는 인덱스: destinationIndex
                //를 MainVC에 보내서 네트워크 전송하면 됨
                print(card, destinationIndex)
            }
        }
    }
}
