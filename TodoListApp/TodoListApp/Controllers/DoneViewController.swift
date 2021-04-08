//
//  DoneViewController.swift
//  TodoListApp
//
//  Created by Song on 2021/04/08.
//

import UIKit

class DoneViewController: UIViewController {
    @IBOutlet weak var headerView: ListHeaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.title = "완료한 일"
        headerView.badgeButton.setTitle("0", for: .normal)
        headerView.badgeButton.layer.masksToBounds = true
        headerView.badgeButton.layer.cornerRadius = headerView.frame.size.height / 2
    }
}
