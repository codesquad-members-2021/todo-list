//
//  DoingTableViewDelegates.swift
//  TodoList
//
//  Created by 조중윤 on 2021/04/13.
//

import UIKit

class DoingTableViewDelegates: NSObject, ToDoCardProtocol {
    var popUpViewProtocol: PopUpViewProtocol?
    
    var list: [ToDoItem] = [] {
        didSet {
            NotificationCenter.default.post(name: .didChangeDoingCardsList, object: nil)
        }
    }
    
    func insertCard(newCard: ToDoItem, at order: Int) {
        self.list.insert(newCard, at: order)
    }
    
    func deleteCard(at index: Int) {
        self.list.remove(at: index)
    }
    
    func moveCard(at sourceIndex: Int, to destinationIndex: Int) {
        guard sourceIndex != destinationIndex else { return }
        
        let place = list[sourceIndex]
        list.remove(at: sourceIndex)
        list.insert(place, at: destinationIndex)
    }
    
    func removeAt(index: Int) {
        list.remove(at: index)
    }
    
    public func fetchCards() {
        let urlString = Constants.url
        DataManager.requestGet(url: urlString) { (bool, output) in
            self.list = output.doing
        }
    }
    
    func dragItems(for indexPath: IndexPath) -> [UIDragItem] {
        let movingCard = list[indexPath.item]
        let itemProvider = NSItemProvider(object: movingCard)
        let dragItem = UIDragItem(itemProvider: itemProvider)
        dragItem.localObject = movingCard
        return [dragItem]
    }
}

extension DoingTableViewDelegates: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCardCell", for: indexPath) as! ToDoCardCell
        let cards = self.list
        cell.titleLabel.text = cards[indexPath.row].title
        cell.contentLabel.text = cards[indexPath.row].contents
        cell.authorLabel.text = "author by \(cards[indexPath.row].id)"
        
        return cell
    }
}

extension DoingTableViewDelegates: UITableViewDelegate {
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        moveCard(at: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView,
            viewForHeaderInSection section: Int) -> UIView? {
       let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                   "sectionHeader") as! CustomHeader
        view.title.text = "진행중인 일"
        view.displayCurrentCardNumOnBadge(number: self.list.count)
        view.button.addTarget(self, action: #selector(firePopUp), for: .touchUpInside)
       return view
    }
    
    @objc func firePopUp() {
        self.popUpViewProtocol?.triggerPopUp()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        CGFloat(50)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title: "삭제", handler: { action, view, completionHaldler in
//            self.deleteCard(at: indexPath.row)
            let cardToBeDeleted = self.list[indexPath.row]
            let id = cardToBeDeleted.id
            DataManager.requestDelete(url: Constants.url, id: id) { (success, responseJSON) in
                print("Delete completed")
                self.fetchCards()
            }
            completionHaldler(true)
        })
        deleteAction.backgroundColor = .systemRed
        return UISwipeActionsConfiguration(actions: [deleteAction])
      }
}

extension DoingTableViewDelegates: UITableViewDragDelegate {
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let dragCoordinator = DragCoordinator(sourceIndexPath: indexPath)
        session.localContext = dragCoordinator
        return dragItems(for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, itemsForAddingTo session: UIDragSession, at indexPath: IndexPath, point: CGPoint) -> [UIDragItem] {
        let item = list[indexPath.row]
        let dragItem = UIDragItem(itemProvider: NSItemProvider(object: item))
        dragItem.localObject = true
        return [dragItem]
    }
    
    func tableView(_ tableView: UITableView, dragSessionDidEnd session: UIDragSession) {
        guard let dragCoordinator = session.localContext as? DragCoordinator, dragCoordinator.dragCompleted == true, dragCoordinator.isReordering == false
        else {
            return
        }
        let sourceIndexPath = dragCoordinator.sourceIndexPath
        tableView.performBatchUpdates( {
            removeAt(index: sourceIndexPath.item)
            tableView.deleteRows(at: [sourceIndexPath], with: .automatic)
        } )
    }
}
