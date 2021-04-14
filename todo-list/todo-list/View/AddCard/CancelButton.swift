//
//  CancelButton.swift
//  todo-list
//
//  Created by Song on 2021/04/14.
//

import UIKit

class CancelButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCornerRadius()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setCornerRadius()
    }
    
    private func setCornerRadius() {
        let radius = bounds.height * 0.1
        layer.cornerRadius = radius
    }
}
