//
//  CompleteButton.swift
//  todo-list
//
//  Created by Song on 2021/04/14.
//

import UIKit

class CompleteButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setCornerRadius()
        disable()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setCornerRadius()
        disable()
    }
    
    private func setCornerRadius() {
        let radius = bounds.height * 0.1
        layer.cornerRadius = radius
    }
    
    func disable() {
        isEnabled = false
        tintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.4)
        backgroundColor = UIColor(red: 0.525, green: 0.775, blue: 1, alpha: 1)
    }
    
    func enable() {
        isEnabled = true
        tintColor = .white
        backgroundColor = UIColor(red: 0, green: 0.459, blue: 0.871, alpha: 1)
    }
}
