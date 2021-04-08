//
//  Column1Cell.swift
//  ToDoListApp
//
//  Created by 박정하 on 2021/04/07.
//

import UIKit

class ColumnCell : UITableViewCell {
    private var title : UILabel
    private var body : UILabel
    private var caption : UILabel
    
    init(reuseIdentifier: String?){
        title = UILabel()
        body = UILabel()
        caption = UILabel()
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        title = UILabel()
        body = UILabel()
        caption = UILabel()
        super.init(coder: coder)
    }
    
    func update(title: String){
        self.title.text = title
    }
    
    func update(body: String){
        
    }
}

extension ColumnCell {
}
