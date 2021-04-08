//
//  ToDoTableViewCell.swift
//  todo-list
//
//  Created by sonjuhyeong on 2021/04/07.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCellRadius()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    private func setCellRadius() {
        let radius = self.frame.height * 0.08
        cellView.layer.cornerRadius = radius
    }
    
}
