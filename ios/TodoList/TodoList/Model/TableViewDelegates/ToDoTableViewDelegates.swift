//
//  ToDoTableViewDelegates.swift
//  TodoList
//
//  Created by 조중윤 on 2021/04/13.
//

import UIKit

class ToDoTableViewDelegates: NSObject {
    var list: [ToDoItem] = [] {
        didSet {
            NotificationCenter.default.post(name: .didChangeToDoCardsList, object: nil)
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
    
    public func fetchCards() {
        let urlString = Constants.url
        DataManager.requestGet(url: urlString) { (bool, output) in
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
        
        view.button.addAction(UIAction.init(handler: { (touch) in
            let dateString = DateFormatter().string(from: Date())
            let testCard = ["id": "jeje", "title": "안녕하세요", "contents": "테스트용 콘텐츠", "createDateTime": dateString, "status": "TODO"]
            
            DataManager.requestPost(url: Constants.url, parameter: testCard) { (bool, toDoList) in
                print(toDoList)
            }
            }), for: .touchUpInside)
       return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        CGFloat(50)
    }
}
