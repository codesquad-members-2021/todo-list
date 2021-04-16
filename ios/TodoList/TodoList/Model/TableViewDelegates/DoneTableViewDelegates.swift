//
//  DoneTableViewDelegates.swift
//  TodoList
//
//  Created by 조중윤 on 2021/04/13.
//

import UIKit

class DoneTableViewDelegates: NSObject, ToDoItemContainer {
    var popUpViewProtocol: PopUpViewProtocol?
    
    var list: [ToDoItem] = [] {
        didSet {
            NotificationCenter.default.post(name: .didChangeDoneItemList, object: nil)
        }
    }
    
    func moveItem(at sourceIndex: Int, to destinationIndex: Int) {
        guard sourceIndex != destinationIndex else { return }
        
        let place = list[sourceIndex]
        list.remove(at: sourceIndex)
        list.insert(place, at: destinationIndex)
    }
    
    public func fetchItems() {
        let urlString = Constants.url
        APIRequestManager.requestGet(url: urlString) { (output) in
            self.list = output.done
        }
    }
    
    func dragItems(for indexPath: IndexPath) -> [UIDragItem] {
        let movingItem = list[indexPath.item]
        let itemProvider = NSItemProvider(object: movingItem)
        let dragItem = UIDragItem(itemProvider: itemProvider)
        dragItem.localObject = movingItem
        return [dragItem]
    }
}

extension DoneTableViewDelegates: UITableViewDataSource {
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        moveItem(at: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath) as! ToDoItemCell
        cell.titleLabel.text = list[indexPath.row].title
        cell.contentLabel.text = list[indexPath.row].contents
        cell.authorLabel.text = "author by \(list[indexPath.row].id)"
        
        return cell
    }
}

extension DoneTableViewDelegates: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
            viewForHeaderInSection section: Int) -> UIView? {
       let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                   "sectionHeader") as! CustomHeader
       view.title.text = "완료한 일"
        view.displayCurrentItemNumberOnBadge(number: self.list.count)
        view.button.addTarget(self, action: #selector(firePopUp), for: .touchUpInside)
        view.backgroundColor = .clear
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
            let ItemToBeDeleted = self.list[indexPath.row]
            let id = ItemToBeDeleted.id
            APIRequestManager.requestDelete(url: Constants.url, id: id) { (responseJSON) in
                self.fetchItems()
            }
            completionHaldler(true)
        })
        deleteAction.backgroundColor = .clear
        return UISwipeActionsConfiguration(actions: [deleteAction])
      }
}

extension DoneTableViewDelegates: UITableViewDragDelegate {
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
            list.remove(at: sourceIndexPath.item)
            tableView.deleteRows(at: [sourceIndexPath], with: .automatic)
        } )
    }
}
