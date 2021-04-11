//
//  DoneTableViewCell.swift
//  TodoList
//
//  Created by Ador on 2021/04/11.
//

import UIKit

class DoneTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var author: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }

    func configure(task: Task) {
        self.title.text = task.title
        self.content.text = task.contents
        self.author.text = "author by IOS"
    }

}
