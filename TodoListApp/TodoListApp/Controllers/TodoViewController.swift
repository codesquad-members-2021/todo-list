//
//  TodoViewController.swift
//  TodoListApp
//
//  Created by Song on 2021/04/08.
//

import UIKit

class TodoViewController: UIViewController {
    @IBOutlet weak var headerView: ListHeaderView!
    @IBOutlet weak var cardTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.title = "해야할 일"
        headerView.badgeButton.setTitle("2", for: .normal)
        headerView.badgeButton.layer.masksToBounds = true
        headerView.badgeButton.layer.cornerRadius = headerView.frame.size.height / 2
        
        cardTableView.dataSource = self
        cardTableView.register(CardCell.nib(), forCellReuseIdentifier: CardCell.identifier)
    }
}

extension TodoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: CardCell.identifier, for: indexPath) as! CardCell
        cell.titleLabel.text = "GitHub 공부하기"
        cell.descriptionLabel.text = "add, commit, push"
        return cell
    }
}
