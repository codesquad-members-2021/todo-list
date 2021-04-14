//
//  ListViewController.swift
//  TodoListApp
//
//  Created by Song on 2021/04/14.
//

import UIKit

class ListViewController: UIViewController, ListViewControllerProtocol {
    @IBOutlet weak var headerView: ListHeaderView!
    @IBOutlet weak var cardTableView: UITableView!
    private var cards: [Card] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.title = self.title
        headerView.badgeButton.setTitle("\(cards.count)", for: .normal)
        headerView.badgeButton.layer.masksToBounds = true
        headerView.badgeButton.layer.cornerRadius = headerView.frame.size.height / 2
        
        cardTableView.dataSource = self
        cardTableView.register(CardCell.nib(), forCellReuseIdentifier: CardCell.identifier)
        cardTableView.sectionFooterHeight = 0.0
        
        headerView.addButton.addTarget(self, action: #selector(showPopupViewController), for: .touchUpInside)
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
    
    @objc func showPopupViewController() {
        let popupVC = PopupViewController(nibName: "PopupViewController", bundle: nil)
        popupVC.modalPresentationStyle = .formSheet
        popupVC.modalTransitionStyle = .coverVertical
        popupVC.preferredContentSize = CGSize(width: 400.0, height: 175.0)
        self.present(popupVC, animated: true, completion: nil)
    }
    
    func updateViewControllerTitle(with listName: String) {
        self.title = listName
    }
}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
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
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "삭제") { (action, view, success) in
            self.cards.remove(at: indexPath.section)
            self.refreshTableView()
        }
        let config = UISwipeActionsConfiguration(actions: [deleteAction])
        config.performsFirstActionWithFullSwipe = false
        return config
    }
}
