//
//  CustomHeader.swift
//  TodoList
//
//  Created by 조중윤 on 2021/04/10.
//

import UIKit

class CustomHeader: UITableViewHeaderFooterView {
    let title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = UIColor.black
        return button
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureContents()
    }
    
    func configureContents() {
        contentView.addSubview(button)
        contentView.addSubview(title)
        contentView.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            title.heightAnchor.constraint(equalToConstant: 30),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                   constant: 8),
//            title.trailingAnchor.constraint(equalTo:
//                   contentView.layoutMarginsGuide.trailingAnchor),
            title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
//            button.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            button.widthAnchor.constraint(equalToConstant: 50),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
}
