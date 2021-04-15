//
//  TodoDelegate.swift
//  Todo_List
//
//  Created by 심영민 on 2021/04/06.
//

import UIKit

class TodoDelegate: NSObject, UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let dataSource = tableView.dataSource as! TodoDataSource
        let userInfo = ["cardNum": dataSource.todoCards[indexPath.row].id]
        
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { (menu) -> UIMenu? in
            let completeAction = UIAction(title: NSLocalizedString("완료한 일로 이동", comment: ""), image: nil) { (action) in
                NotificationCenter.default.post(name: .completeCard,
                                                                object: nil,
                                                                userInfo: userInfo)
            }
            let modifyAction = UIAction(title: NSLocalizedString("수정하기", comment: ""), image: nil) { (action) in
                NotificationCenter.default.post(name: .modifyCard,
                                                                object: nil,
                                                                userInfo: userInfo)
            }
            let deleteAction = UIAction(title: NSLocalizedString("삭제하기", comment: ""), image: UIImage(systemName: "trash"), attributes: .destructive) { (action) in
                NotificationCenter.default.post(name: .removeCard,
                                                                object: nil,
                                                                userInfo: userInfo)
            }
            
            return UIMenu(title: "", children: [completeAction, modifyAction, deleteAction])
        }
    }
    
}
