//
//  TableViewDelegate.swift
//  Todo_List
//
//  Created by 박혜원 on 2021/04/14.
//

import UIKit

class TableViewDelegate: NSObject, UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        return (view as! UITableViewHeaderFooterView).contentView.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.969, alpha: 1)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CardViewConstant.heightForHeaderInSection
    }
}
