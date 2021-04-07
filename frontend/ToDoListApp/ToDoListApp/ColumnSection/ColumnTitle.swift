//
//  ColumnTitle.swift
//  ToDoListApp
//
//  Created by 박정하 on 2021/04/07.
//

import UIKit

class ColumnTitle : UILabel{
    init(frame: CGRect, title: String) {
        super.init(frame: frame)
        self.text = title
        self.sizeToFit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.text = ""
        self.sizeToFit()
    }
}
