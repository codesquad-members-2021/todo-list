//
//  CardMargin.swift
//  todo-list
//
//  Created by Song on 2021/04/12.
//

import UIKit

class CardMargin: UITableViewHeaderFooterView {
    
    private let colorView = UIView()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }

    private func configure() {
        colorView.frame = CGRect(x: 0, y: 0, width: 256, height: 8)
        colorView.backgroundColor = UIColor(named: "BackgroundGrey")
        contentView.addSubview(colorView)
    }
}
