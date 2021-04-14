//
//  CardButton.swift
//  TodoList
//
//  Created by Ador on 2021/04/12.
//

import UIKit

class CardButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.layer.cornerRadius = 10
    }
}
