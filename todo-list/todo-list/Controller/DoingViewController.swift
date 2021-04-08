//
//  DoingViewController.swift
//  todo-list
//
//  Created by sonjuhyeong on 2021/04/07.
//

import UIKit

class DoingViewController: UIViewController {

    @IBOutlet weak var badgeView: UIView!
    @IBOutlet weak var badgeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBadgeViewRadius()
    }
    
    @IBAction func addButtonTouched(_ sender: Any) {
    }
    
    private func setBadgeViewRadius() {
        let radius = badgeView.bounds.height * 0.5
        badgeView.layer.cornerRadius = radius
    }
}
