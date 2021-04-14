//
//  SectionCell.swift
//  TODOList
//
//  Created by Issac on 2021/04/06.
//

import UIKit

class SectionCell: UITableViewCell {
    static let identifier = "sectionCell"
    
    @IBOutlet weak var subject: UILabel!
    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var author: UILabel!
}
