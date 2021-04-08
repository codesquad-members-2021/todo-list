//
//  DoingViewController.swift
//  TodoListApp
//
//  Created by Song on 2021/04/08.
//

import UIKit

class DoingViewController: UIViewController {
    @IBOutlet weak var headerView: ListHeaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.title = "하고 있는 일"
        headerView.badgeButton.setTitle("1", for: .normal)
        headerView.badgeButton.layer.masksToBounds = true
        headerView.badgeButton.layer.cornerRadius = headerView.frame.size.height / 2
    }
}
