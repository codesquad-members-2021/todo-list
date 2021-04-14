//
//  ListViewController.swift
//  TodoListApp
//
//  Created by Song on 2021/04/14.
//

import UIKit

class ListViewController: UIViewController, ListViewControllerProtocol, PopupViewDelegate, UITableViewDelegate {
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
        cardTableView.delegate = self
        cardTableView.dragDelegate = self
        
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
    
    func registerButtonPressed(title: String, notes: String) {
        cardsDataSource.registerCard(title: title, notes: notes)
        refreshTableView()
        updateBadgeCount()
    }
    
    @objc func showPopupViewController() {
        let popupVC = PopupViewController(nibName: "PopupViewController", bundle: nil)
        popupVC.modalPresentationStyle = .formSheet
        popupVC.modalTransitionStyle = .coverVertical
        popupVC.preferredContentSize = CGSize(width: 400.0, height: 175.0)
        popupVC.delegate = self
        self.present(popupVC, animated: true, completion: nil)
    }
    
    func updateBadgeCount() {
        headerView.badgeButton.setTitle("\(cardsDataSource.cardsCount)", for: .normal)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "삭제") { (action, view, success) in
            self.cardsDataSource.deleteCard(at: indexPath.section)
            tableView.deleteSections(NSIndexSet(index: indexPath.section) as IndexSet, with: .automatic)
            self.updateBadgeCount()
        }
        let config = UISwipeActionsConfiguration(actions: [deleteAction])
        config.performsFirstActionWithFullSwipe = false
        return config
    }
}

//MARK: - UITableViewDragDelegate
extension ListViewController: UITableViewDragDelegate {
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let dragCoordinator = CacheDragCoordinator(sourceIndexPath: indexPath)
        session.localContext = dragCoordinator
        return cardsDataSource.dragItems(for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, dragSessionDidEnd session: UIDragSession) {
        guard let dragCoordinator = session.localContext as? CacheDragCoordinator,
              dragCoordinator.dragCompleted == true,
              dragCoordinator.isReordering == false else {
            return
        }
        let sourceIndexPath = dragCoordinator.sourceIndexPath
        tableView.performBatchUpdates({
            cardsDataSource.deleteCard(at: sourceIndexPath.section)
            tableView.deleteSections(NSIndexSet(index: sourceIndexPath.section) as IndexSet, with: .automatic)
        }, completion: nil)
        updateBadgeCount()
    }
}
