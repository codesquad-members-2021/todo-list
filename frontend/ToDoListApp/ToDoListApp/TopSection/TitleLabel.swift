//
//  TitleLabel.swift
//  ToDoListApp
//
//  Created by 박정하 on 2021/04/06.
//

import UIKit

class TitleLabel : UILabel {
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.text = "TO-DO LIST"
        self.font = UIFont.systemFont(ofSize: 32)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
