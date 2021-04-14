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
        
        let cm = CardManager.shared
        
        switch tableView {
                
        case todo:
            cm.setCard(type: 0, index: indexPath.section)
            cardInfo = board.todoList.items[indexPath.section]
        case doing:
            cm.setCard(type: 1, index: indexPath.section)
            cardInfo = board.doingList.items[indexPath.section]
        case done:
            cm.setCard(type: 2, index: indexPath.section)
            cardInfo = board.doneList.items[indexPath.section]
        default:
            break
            
        }
                
        let itemProvider = NSItemProvider(object: cardInfo)
        let dragItem = UIDragItem(itemProvider: itemProvider)
                
        return [dragItem]
        
    }
    
    
}
