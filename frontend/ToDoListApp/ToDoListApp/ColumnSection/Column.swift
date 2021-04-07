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
        self.tableHeaderView = initHeader(headertitle: HeaderTitle)
    }
    
    required init?(coder: NSCoder) {
        columnCell = ColumnCell.init(reuseIdentifier: "")
        super.init(coder: coder)
    }
    
    private func initHeader(headertitle : String) -> UILabel{
        let header : UILabel = UILabel()
        header.text = headertitle
        header.font = UIFont.boldSystemFont(ofSize: 18)
        header.sizeToFit()
        return header
    }
}
