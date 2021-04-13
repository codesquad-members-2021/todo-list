//
//  Column1Cell.swift
//  ToDoListApp
//
//  Created by 박정하 on 2021/04/07.
//

import UIKit

class ColumnCell : UITableViewCell {
    @IBOutlet weak private var title : UILabel!
    @IBOutlet weak private var content : UILabel!
    @IBOutlet weak private var caption : UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func update(title: String){
        self.title.text = title
    }
    
    func update(content: String){
        self.content.text = content
    }
}

extension ColumnCell {
    
}
