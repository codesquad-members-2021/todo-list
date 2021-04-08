//
//  DoneTableViewDelegate.swift
//  ToDoListApp
//
//  Created by 지북 on 2021/04/08.
//

import Foundation
import UIKit

class DoneTableViewDelegate: NSObject, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.systemGray6
    }
}
