//
//  CardsDataSource.swift
//  TodoListApp
//
//  Created by Song on 2021/04/14.
//

import UIKit

class CardsDataSource: NSObject, UITableViewDataSource {
    private var cards: [Card]
    var cardsCount: Int {
        return cards.count
    }
    
    init(cards: [Card]) {
        self.cards = cards
        super.init()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cards.count
    }
    
    private func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 16.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: CardCell.identifier, for: indexPath) as! CardCell
        DispatchQueue.main.async {
            let card = self.cards[indexPath.section]
            cell.titleLabel.text = card.title
            cell.descriptionLabel.text = card.notes
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "삭제") { (action, view, success) in
            self.cards.remove(at: indexPath.section)
        }
        let config = UISwipeActionsConfiguration(actions: [deleteAction])
        config.performsFirstActionWithFullSwipe = false
        return config
    }
    
    func insert(_ card: Card, at index: Int) {
        cards.insert(card, at: index)
    }
}
