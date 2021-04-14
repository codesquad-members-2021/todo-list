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
    private var cardsDataSource = CardsDataSource(cards: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.title = self.title
        headerView.badgeButton.setTitle("\(cardsDataSource.cardsCount)", for: .normal)
        headerView.badgeButton.layer.masksToBounds = true
        headerView.badgeButton.layer.cornerRadius = headerView.frame.size.height / 2
        
        cardTableView.dataSource = cardsDataSource
        cardTableView.register(CardCell.nib(), forCellReuseIdentifier: CardCell.identifier)
        cardTableView.sectionFooterHeight = 0.0
        
        headerView.addButton.addTarget(self, action: #selector(showPopupViewController), for: .touchUpInside)
    }
    
    func filterCards(of category: String, from allCards: [Card]) {
        allCards.filter { card in card.category == category }
            .enumerated().forEach { index, card in cardsDataSource.insert(card, at: index) }
    }
    
    func updateViewControllerTitle(with listName: String) {
        self.title = listName
    }
    
    func refreshTableView() {
        cardTableView.reloadData()
    }
    
    @objc func showPopupViewController() {
        let popupVC = PopupViewController(nibName: "PopupViewController", bundle: nil)
        popupVC.modalPresentationStyle = .formSheet
        popupVC.modalTransitionStyle = .coverVertical
        popupVC.preferredContentSize = CGSize(width: 400.0, height: 175.0)
        self.present(popupVC, animated: true, completion: nil)
    }
}
