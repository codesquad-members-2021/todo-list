//
//  Badge.swift
//  ToDoListApp
//
//  Created by 박정하 on 2021/04/07.
//

import UIKit

class Badge : UILabel{
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = "0"
        self.layer.cornerRadius = 13
        self.clipsToBounds = true
        self.backgroundColor = .systemRed
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = "0"
        self.layer.cornerRadius = 13
        self.clipsToBounds = true
        self.backgroundColor = .systemGray
    }
}
