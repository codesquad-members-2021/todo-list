//
//  DoneViewController.swift
//  TodoListApp
//
//  Created by Song on 2021/04/08.
//

import UIKit

class DoneViewController: UIViewController, ListViewControllerProtocol {
    @IBOutlet weak var headerView: ListHeaderView!
    @IBOutlet weak var cardTableView: UITableView!
    private var cards: [Card] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.title = "완료한 일"
        headerView.badgeButton.setTitle("0", for: .normal)
        headerView.badgeButton.layer.masksToBounds = true
        headerView.badgeButton.layer.cornerRadius = headerView.frame.size.height / 2
        
        cardTableView.dataSource = self
        cardTableView.register(CardCell.nib(), forCellReuseIdentifier: CardCell.identifier)
    }
    
    func filterCards(of category: String, from allCards: [Card]) {
        cards = allCards.filter { card in
            card.category == category
        }
    }
    
    func refreshTableView() {
        cardTableView.reloadData()
    }
}

extension DoneViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: CardCell.identifier, for: indexPath) as! CardCell
        DispatchQueue.main.async {
            cell.titleLabel.text = self.cards[indexPath.row].title
            cell.descriptionLabel.text = self.cards[indexPath.row].description
        }
        return cell
    }
}
