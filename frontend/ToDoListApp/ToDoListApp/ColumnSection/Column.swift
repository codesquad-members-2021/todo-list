//
//  Column.swift
//  ToDoListApp
//
//  Created by 박정하 on 2021/04/06.
//

import UIKit

class Column : UITableView {
    private let columnCell : ColumnCell
    
    init(frame: CGRect, Cellidentifier : String, HeaderTitle : String) {
        columnCell = ColumnCell.init(reuseIdentifier: Cellidentifier)
        super.init(frame: frame, style: .insetGrouped)
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        columnCell = ColumnCell.init(reuseIdentifier: "")
        super.init(coder: coder)
    }
}
