//
//  CardCell.swift
//  ToDoListApp
//
//  Created by user on 2021/04/07.
//

import UIKit

class CardCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var contents: UILabel!
    @IBOutlet weak var author: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.clipsToBounds = true
        self.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
