//
//  SubmitButton.swift
//  TODOList
//
//  Created by Issac on 2021/04/08.
//

import UIKit

class SubmitButton: UIButton {
    required init() {
        super.init(frame: .zero)
        self.setDisabledButtonStyle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setDisabledButtonStyle()
    }
    
    private func setDisabledButtonStyle() {
        let disabledColor = UIColor(displayP3Red: 134/255, green: 198/255, blue: 255/255, alpha: 1)
        self.setBackgroundColor(disabledColor, for: .disabled)
    }
}

extension UIButton {
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setFillColor(color.cgColor)
        context.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let backgroundImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.setBackgroundImage(backgroundImage, for: state)
    }
}
