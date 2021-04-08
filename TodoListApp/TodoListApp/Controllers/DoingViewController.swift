//
//  DoingViewController.swift
//  TodoListApp
//
//  Created by Song on 2021/04/08.
//

import UIKit

class DoingViewController: UIViewController {
    @IBOutlet weak var headerView: ListHeaderView!
    @IBOutlet weak var cardTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.title = "하고 있는 일"
        headerView.badgeButton.setTitle("1", for: .normal)
        headerView.badgeButton.layer.masksToBounds = true
        headerView.badgeButton.layer.cornerRadius = headerView.frame.size.height / 2
        
        cardTableView.dataSource = self
        cardTableView.register(CardCell.nib(), forCellReuseIdentifier: CardCell.identifier)
    }
}

extension DoingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: CardCell.identifier, for: indexPath) as! CardCell
        cell.titleLabel.text = "HTML/CSS 공부하기"
        cell.descriptionLabel.text = "input 태그 실습"
        return cell
    }
}
