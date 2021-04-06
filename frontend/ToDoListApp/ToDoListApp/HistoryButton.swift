//
//  HistoryButton.swift
//  ToDoListApp
//
//  Created by 박정하 on 2021/04/06.
//

import UIKit

class HistoryButton : UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.tintColor = .black
        self.setImage(UIImage.init(systemName: "line.horizontal.3"), for: .normal)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = .white
        self.tintColor = .black
        self.setImage(UIImage.init(systemName: "line.horizontal.3"), for: .normal)
    }
}
