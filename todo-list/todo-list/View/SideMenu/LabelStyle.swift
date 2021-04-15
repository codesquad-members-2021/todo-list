//
//  LabelStyle.swift
//  todo-list
//
//  Created by Song on 2021/04/15.
//

import UIKit

extension NSMutableAttributedString {
    
    func makeString(of content: String, separator: Character) -> NSMutableAttributedString {
        let contents = content.split(separator: separator).map{ String($0) }
        let text = NSMutableAttributedString()
        
        for (idx, content) in contents.enumerated() {
            if idx % 2 == 0 {
                text.bold(content)
            } else {
                text.normal(content)
            }
        }
        return text
    }
    
    private func bold(_ text: String) {
        let attributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]
        self.append(NSMutableAttributedString(string: text, attributes: attributes))
    }
    
    private func normal(_ text: String) {
        let attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)]
        self.append(NSMutableAttributedString(string: text, attributes: attributes))
    }
}
