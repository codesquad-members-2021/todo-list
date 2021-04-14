//
//  ListHeaderView.swift
//  TodoListApp
//
//  Created by Song on 2021/04/07.
//

import UIKit

class ListHeaderView: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var badgeButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    var title: String? {
        get {
            return titleLabel.text
        }
        set {
            titleLabel.text = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        let nib = UINib(nibName: "ListHeaderView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
        
        badgeButton.widthAnchor.constraint(greaterThanOrEqualTo: badgeButton.heightAnchor).isActive = true
        badgeButton.isEnabled = false
        badgeButton.setTitleColor(.black, for: .disabled)
        badgeButton.contentEdgeInsets = UIEdgeInsets(top: 0.0, left: 6.0, bottom: 0.0, right: 6.0)
    }
}
