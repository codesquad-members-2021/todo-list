//
//  ToDoCard.swift
//  TodoList
//
//  Created by 조중윤 on 2021/04/08.
//

import UIKit

class ToDoCardCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        self.contentView.layer.cornerRadius = 30
        self.contentView.layer.masksToBounds = true
        self.contentView.layer.borderWidth = 2
        self.contentView.layer.borderColor = UIColor.white.cgColor
        
        self.titleLabel.textColor = .white
        self.contentLabel.textColor = .white
        self.authorLabel.textColor = .white
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
