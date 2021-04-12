//
//  TodoViewController.swift
//  TodoListApp
//
//  Created by Song on 2021/04/08.
//

import UIKit

class TodoViewController: UIViewController, ListViewControllerProtocol {
    @IBOutlet weak var headerView: ListHeaderView!
    @IBOutlet weak var cardTableView: UITableView!
    private var cards: [Card] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.title = "해야할 일"
        headerView.badgeButton.setTitle("\(cards.count)", for: .normal)
        headerView.badgeButton.layer.masksToBounds = true
        headerView.badgeButton.layer.cornerRadius = headerView.frame.size.height / 2
        
        cardTableView.dataSource = self
        cardTableView.delegate  = self
        cardTableView.register(CardCell.nib(), forCellReuseIdentifier: CardCell.identifier)
    }
    
    func filterCards(of category: String, from allCards: [Card]) {
        cards = allCards.filter { card in
            card.category == category
        }
    }
    
    func refreshTableView() {
        cardTableView.reloadData()
        headerView.badgeButton.setTitle("\(cards.count)", for: .normal)
    }
}

extension TodoViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return cards.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 16.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: CardCell.identifier, for: indexPath) as! CardCell
        DispatchQueue.main.async {
            cell.titleLabel.text = self.cards[indexPath.section].title
            cell.descriptionLabel.text = self.cards[indexPath.section].description
        }
        return cell
    }
}
