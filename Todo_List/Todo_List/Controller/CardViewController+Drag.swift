//
//  TaskViewController+Drag.swift
//  Todo_List
//
//  Created by 박혜원 on 2021/04/09.
//

import UIKit
import MobileCoreServices

/*Drag 하는 순간 불리며 해당 아이템의 정보를 Data에 담는 과정이 일어남*/
extension CardViewController : UITableViewDragDelegate {
    
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        var cardInfo = Card()
        let cardManager = CardManager.shared
        
        switch tableView {
                
        case todo:
            cardManager.setCard(type: Board.CardType(rawValue: Board.CardType.todo.rawValue)!, index: indexPath.section)
            cardInfo = board.todoList.items[indexPath.section]
        case doing:
            cardManager.setCard(type: Board.CardType(rawValue: Board.CardType.doing.rawValue)!, index: indexPath.section)
            cardInfo = board.doingList.items[indexPath.section]
        case done:
            cardManager.setCard(type: Board.CardType(rawValue: Board.CardType.done.rawValue)!, index: indexPath.section)
            cardInfo = board.doneList.items[indexPath.section]
        default:
            break
            
        }
                
        let itemProvider = NSItemProvider(object: cardInfo)
        let dragItem = UIDragItem(itemProvider: itemProvider)
                
        return [dragItem]
        
    }
    
    
}
