//
//  TableViewDragDelegate.swift
//  Todo_List
//
//  Created by 박혜원 on 2021/04/14.
//

import UIKit


class TableViewDragDelegate: NSObject, UITableViewDragDelegate {

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
        default : break
        }
             
        let itemProvider = NSItemProvider(object: cardInfo)
        let dragItem = UIDragItem(itemProvider: itemProvider)
                
        return [dragItem]
    }
}

