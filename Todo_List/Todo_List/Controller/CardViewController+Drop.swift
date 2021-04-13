//
//  TaskViewController+Drop.swift
//  Todo_List
//
//  Created by 박혜원 on 2021/04/09.
//

import UIKit

extension CardViewController : UITableViewDropDelegate {
    //카피문제.. 테이블내에서 움직이는것은 1.테이블델리게이터, 2.드드 양자택일
    
//    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        true //이건 왜 쓰는지 잘 모르겠음여
//
//    }
    func tableView(_ tableView: UITableView, canHandle session: UIDropSession) -> Bool {
        true
    }
    
    /*테이블 이동 시 handling a drop in a table view. */
    func tableView(_ tableView: UITableView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UITableViewDropProposal {
        UITableViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
    }
    
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
        
        let destinationIndexPath: IndexPath
        
        
        if let indexPath = coordinator.destinationIndexPath {
            destinationIndexPath = IndexPath(row: 0, section: indexPath.section)
            
        } else {
            destinationIndexPath = IndexPath(row: 0, section: 0)
        }
        
        print("destinationIndexPath=",destinationIndexPath)
        print("coordinator.items=",coordinator.items.count)
        
        for item in coordinator.items {
            item.dragItem.itemProvider.loadObject(ofClass: Card.self, completionHandler: { (card, error) in
                if let card = card as? Card {
//                    print("card",card.content,card.title,card.writer)
                    
                    DispatchQueue.main.async { //꼭 해야하는지는 후에 테스트가 필요.
                        switch tableView {
                        //특정함수를 호출하기 위한 노티피케이션
                        case self.todo :
                            self.board.append(with: card, type: .todo, at: destinationIndexPath.section)
                        case self.doing :
                            self.board.append(with: card, type: .doing, at: destinationIndexPath.section)
                        case self.done :
                            self.board.append(with: card, type: .done, at: destinationIndexPath.section)
                        default:
                            break
                        }
                        let cm = CardManager.shared
                        self.board.remove(at: cm.indexPathSection, type: Board.CardType(rawValue: cm.getBoardType())!)
//                        self.indexPathSection = -1
//                        self.boardType = -1
                    }
                }
            })
        }
    }
}
