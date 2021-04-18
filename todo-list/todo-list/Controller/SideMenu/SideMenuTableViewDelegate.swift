//
//  SideMenuTableViewDelegate.swift
//  todo-list
//
//  Created by Song on 2021/04/14.
//

import UIKit

class SideMenuTableViewDelegate: NSObject, UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 137
    }
    
}
