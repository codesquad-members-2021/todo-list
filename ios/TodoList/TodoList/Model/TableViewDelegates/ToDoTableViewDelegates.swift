//
//  ToDoTableViewDelegates.swift
//  TodoList
//
//  Created by 조중윤 on 2021/04/13.
//

import UIKit

class ToDoTableViewDelegates: NSObject, ToDoCardProtocol {
    var popUpViewProtocol: PopUpViewProtocol?
    
    var list: [ToDoItem] = [] {
        didSet {
            print("didSet list")
            NotificationCenter.default.post(name: .didChangeToDoCardsList, object: nil)
        }
    }
    
    func insertCard(newCard: ToDoItem, at order: Int) {
        self.list.insert(newCard, at: order)
    }
    
    func moveCard(at sourceIndex: Int, to destinationIndex: Int) {
        guard sourceIndex != destinationIndex else { return }
        
        let place = list[sourceIndex]
        list.remove(at: sourceIndex)
        list.insert(place, at: destinationIndex)
    }
    
    public func fetchCards() {
        let urlString = Constants.url
        DataManager.requestGet(url: urlString) { (bool, output) in
            print("fetched card")
            self.list = output.todo
        }
    }
}

extension ToDoTableViewDelegates: UITableViewDataSource {
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

extension ToDoTableViewDelegates: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
            viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                   "sectionHeader") as! CustomHeader
        view.title.text = "해야 할 일"
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
