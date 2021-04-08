//
//  ToDoCard.swift
//  TodoList
//
//  Created by 조중윤 on 2021/04/08.
//

import UIKit

class ToDoCardCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentsLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = .blue
        self.contentView.layer.cornerRadius = 30
//        self.contentView.layer.masksToBounds = true
        self.contentView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.contentView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.contentView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        self.contentView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
