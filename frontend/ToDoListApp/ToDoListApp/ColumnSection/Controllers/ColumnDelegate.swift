//
//  Column1Delegate.swift
//  ToDoListApp
//
//  Created by 박정하 on 2021/04/07.
//

import UIKit

class ColumnDelegate : NSObject, UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(30)
    }
}
