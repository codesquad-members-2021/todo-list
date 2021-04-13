//
//  AddLineSpacing.swift
//  Todo_List
//
//  Created by Lia on 2021/04/07.
//

import UIKit

extension UILabel {

    func addLineSpacing(_ spacingValue: CGFloat = 5) {
        
        guard let textString = self.text else { return }

        let attributedString = NSMutableAttributedString(string: textString)
        let paragraphStyle = NSMutableParagraphStyle()
        
        paragraphStyle.lineSpacing = spacingValue
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
        
        self.attributedText = attributedString
    }
}
