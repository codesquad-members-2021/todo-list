//
//  ToDoCell.swift
//  ToDoListApp
//
//  Created by zombietux on 2021/04/07.
//

import UIKit

class CardCell: UITableViewCell {
    
    static let identifier = "CardCell"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentsLabel: UILabel!
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    var contents: String? {
        didSet {
            contentsLabel.text = contents
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
