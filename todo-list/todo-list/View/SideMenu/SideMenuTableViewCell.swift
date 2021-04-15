//
//  SideMenuTableViewCell.swift
//  todo-list
//
//  Created by Song on 2021/04/14.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
