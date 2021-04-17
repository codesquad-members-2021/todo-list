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
        cardTableView.dropDelegate = self
        
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

//MARK: - UITableViewDropDelegate
extension ListViewController: UITableViewDropDelegate {
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
        //let dataSource = cardsDataSource
        let destinationIndexPath: IndexPath
        if let indexPath = coordinator.destinationIndexPath {
            destinationIndexPath = indexPath
        } else {
            destinationIndexPath = IndexPath(item: 0, section: tableView.numberOfSections)
        }
        let item = coordinator.items[0]
        
        guard let dragCoordinator = coordinator.session.localDragSession?.localContext as? CacheDragCoordinator else { return }
        if let sourceIndexPath = item.sourceIndexPath {
            dragCoordinator.isReordering = true
            tableView.performBatchUpdates({
                cardsDataSource.moveCard(at: sourceIndexPath.section, to: destinationIndexPath.section)
                tableView.deleteSections(NSIndexSet(index: sourceIndexPath.section) as IndexSet, with: .automatic)
                tableView.insertSections(NSIndexSet(index: destinationIndexPath.section) as IndexSet, with: .automatic)
            }, completion: nil)
        } else {
            dragCoordinator.isReordering = false
            
            if let card = item.dragItem.localObject as? Card {
                tableView.performBatchUpdates({
                    cardsDataSource.insert(card, at: destinationIndexPath.section)
                    tableView.insertSections(NSIndexSet(index: destinationIndexPath.section) as IndexSet, with: .automatic)
                }, completion: nil)
            } else {
                let itemProvider = item.dragItem.itemProvider
                itemProvider.loadObject(ofClass: Card.self, completionHandler: { (data, error) in
                    if let card = data as? Card {
                        self.cardsDataSource.insert(card, at: destinationIndexPath.section)
                        DispatchQueue.main.async {
                            tableView.insertSections(NSIndexSet(index: destinationIndexPath.section) as IndexSet, with: .automatic)
                        }
                    }
                })
            }
        }
        dragCoordinator.dragCompleted = true
        updateBadgeCount()
        coordinator.drop(item.dragItem, toRowAt: destinationIndexPath)
    }
    
    func tableView(_ tableView: UITableView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UITableViewDropProposal {
        guard session.items.count == 1 else {
            return UITableViewDropProposal(operation: .cancel)
        }
        if tableView.hasActiveDrag {
            return UITableViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
        } else {
            return UITableViewDropProposal(operation: .copy, intent: .insertAtDestinationIndexPath)
        }
    }
}
