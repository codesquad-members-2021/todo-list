//
//  CardCell.swift
//  TodoListApp
//
//  Created by Song on 2021/04/08.
//

import UIKit

class CardCell: UITableViewCell {
    @IBOutlet weak var cardBackgroundView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    static let identifier = "CardCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardBackgroundView.layer.masksToBounds = true
        cardBackgroundView.layer.cornerRadius = 6.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
