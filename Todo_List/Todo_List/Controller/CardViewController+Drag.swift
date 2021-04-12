//
//  TaskViewController+Drag.swift
//  Todo_List
//
//  Created by 박혜원 on 2021/04/09.
//

import UIKit

extension CardViewController : UITableViewDragDelegate {
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        
        return [UIDragItem]()
    }
    
    
}
