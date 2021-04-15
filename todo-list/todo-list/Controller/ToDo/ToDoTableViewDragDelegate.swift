//
//  ToDoTableViewDragDelegate.swift
//  todo-list
//
//  Created by Song on 2021/04/14.
//

import UIKit
import MobileCoreServices

class ToDoTableViewDragDelegate: NSObject, UITableViewDragDelegate {

    private let cardSearcher: CardFindable
    
    init(cardSearcher: CardFindable) {
        self.cardSearcher = cardSearcher
    }
    
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let currentIdx = indexPath.section
        let currentCard = cardSearcher.cardAt(index: currentIdx)
        
        let cardData = ParsingManager.encodeData(data: currentCard)
        let itemProvider = NSItemProvider()
        
        itemProvider.registerDataRepresentation(forTypeIdentifier: kUTTypePlainText as String, visibility: .all) { completion in
            completion(cardData, nil)
            return nil
        }
        return [UIDragItem(itemProvider: itemProvider)]
    }
    
    func tableView(_ tableView: UITableView, canHandle session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass: NSString.self)
    }

}
