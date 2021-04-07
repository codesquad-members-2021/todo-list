//
//  ColumnViewController.swift
//  ToDoListApp
//
//  Created by 박정하 on 2021/04/07.
//

import UIKit

class ColumnViewController : UIViewController{
    override func viewDidLoad() {
        self.view.addSubview(Column.init(frame: CGRect(x: 48, y: 123, width: 256, height: 294), Cellidentifier: CellIdentifiers.column1.rawValue, HeaderTitle: "해야할 일"))
        super.viewDidLoad()
    }
}
