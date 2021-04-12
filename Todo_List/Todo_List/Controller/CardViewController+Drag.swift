//
//  TaskViewController+Drag.swift
//  Todo_List
//
//  Created by 박혜원 on 2021/04/09.
//

import UIKit
import MobileCoreServices

//data를 가져야 하는데 card로 넘기려고 했으나 실패하여 모두 string변수를 잡는 구조체를 만듦 (후에 id,date 또한 String으로 컨버팅이 필요할수 있음)
//struct CardInfo {
//
//    var title : String
//    var content : String
//    var writer : String
//}

/*Drag 하는 순간 불리며 해당 아이템의 정보를 Data에 담는 과정이 일어남*/
extension CardViewController : UITableViewDragDelegate {
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        

        var cardInfo = Card()
        
        switch tableView {
        
        case todo:
            cardInfo = board.todoList[indexPath.section]
//            card = Card(title: info.title, content: info.content, writer: info.writer)
        case doing:
            cardInfo = board.doingList[indexPath.section]
//            card = Card(title: info.title, content: info.content, writer: info.writer)
        case done:
            cardInfo = board.doneList[indexPath.section]
//            card = Card(title: info.title, content: info.content, writer: info.writer)
        default:
            break
        }
//        let cardInfo = CardInfo(title: info.title, content: info.content, writer: info.writer)
        
        /*Info를 Data 처리화 하는 process*/
        
//        NSItemProvider의 object로 들어가려면
//        NSItemProviderWriting(NSItemProviderReading도 있어요!)


        let itemProvider = NSItemProvider(object: cardInfo)
        let dragItem = UIDragItem(itemProvider: itemProvider)
        dragItem.localObject = cardInfo
        
        print("dragItem = ", dragItem.localObject)
        
        return [dragItem]
        
//        let string = tableView == leftTableView ? leftItems[indexPath.row] : rightItems[indexPath.row]
//            guard let data = string.data(using: .utf8) else { return [] }
//            let itemProvider = NSItemProvider(item: data as NSData, typeIdentifier: kUTTypePlainText as String)
//
//    Provider: itemProvider)]
        
    }
    
    
}
