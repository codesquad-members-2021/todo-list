//
//  DoingDelegate.swift
//  TodoList
//
//  Created by HOONHA CHOI on 2021/04/07.
//

import Foundation
import UIKit

class DoingDelegate : NSObject {}

extension DoingDelegate : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let cellSpacingHeight: CGFloat = 15
        return cellSpacingHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           if editingStyle == .delete {
           }
    }
    
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { suggestedActions in
            
            let share = UIAction(title: "완료한 일로 이동") { action in
                // Show system share sheet
            }
            
            let rename = UIAction(title: "수정하기") { action in
                // Perform renaming
            }
            
            let delete = UIAction(title: "삭제하기", attributes: .destructive) { action in
                // Perform delete
            }
            
            return UIMenu(title: "", children: [share, rename, delete])
        }
    }
}
