//
//  HistoryCell.swift
//  TODOList
//
//  Created by Issac on 2021/04/10.
//

import UIKit

class HistoryCell: UITableViewCell {
    static let identifier = "HistoryCell"
    
    @IBOutlet weak var stateImageView: UIImageView!
    @IBOutlet weak var user: UILabel!
    @IBOutlet weak var contents: UILabel!
    @IBOutlet weak var time: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
