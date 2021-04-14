//
//  ToDoTableViewDelegate.swift
//  todo-list
//
//  Created by sonjuhyeong on 2021/04/13.
//

import UIKit

class ToDoTableViewDelegate: NSObject, UITableViewDelegate {
    
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
            completion(true)
        }
        
        let actionConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
        return actionConfiguration
    }
}
