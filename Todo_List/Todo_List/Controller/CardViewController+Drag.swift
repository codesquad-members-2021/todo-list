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
        
        //이 곳에서 노티피케이션을 쏴주어할것 같다. 필요한 것은 type과 indexPath.section
        case todo:
            cm.setCard(type: 0, index: indexPath.section)
            cardInfo = board.todoList[indexPath.section]
        case doing:
            cm.setCard(type: 1, index: indexPath.section)
            cardInfo = board.doingList[indexPath.section]
        case done:
            cm.setCard(type: 2, index: indexPath.section)
            cardInfo = board.doneList[indexPath.section]
        default:
            break
            
        }
        
        
        let itemProvider = NSItemProvider(object: cardInfo)
        let dragItem = UIDragItem(itemProvider: itemProvider)
        
        /*써야하는 이유가 있을까?
         dragItem.localObject = cardInfo
         print("dragItem = ", dragItem.localObject)*/
        
        return [dragItem]
        
    }
    
    
}
