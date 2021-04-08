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
    @IBOutlet weak var authorLabel: UILabel!
    
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
    
    var author: String? {
        didSet {
            authorLabel.text = "author by \(author ?? "")"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
