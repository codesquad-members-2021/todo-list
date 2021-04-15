//
//  ToDoTableViewDelegate.swift
//  todo-list
//
//  Created by sonjuhyeong on 2021/04/13.
//

import UIKit

class ToDoTableViewDelegate: NSObject, UITableViewDelegate {
    
    private let cardDeletor: CardDeletable
    
    init(cardDeletor: CardDeletable) {
        self.cardDeletor = cardDeletor
    }
    
    let cardMargin = CGFloat(8)
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "cardMargin") as! CardMargin
        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "cardMargin") as! CardMargin
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cardMargin
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return cardMargin
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "delete") { (action, view, completion) in
            //tableView.deleteRows(at: [indexPath], with: .automatic) - 삭제에 해당하는 네트워크 동작으로 업데이트
            //category, cardID
            let index = indexPath.section
            self.cardDeletor.delete(cardAt: index)
            completion(true)
        }
        
        let actionConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
        return actionConfiguration
    }
    
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
            return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { suggestedActions in
                
                let share = UIAction(title: "완료한 일로 이동") { action in
                }
                
                let rename = UIAction(title: "수정하기") { [weak self] action in
                    guard let cell = tableView.cellForRow(at: indexPath) as? ToDoTableViewCell else { return }
                    guard let title = cell.titleLabel.text, let contents = cell.contentLabel.text else { return }

                }
                
                let delete = UIAction(title: "삭제하기", attributes: .destructive) { action in
                }
                
                return UIMenu(title: "", children: [share, rename, delete])
            }
        }
}
