//
//  ToDoTableViewDelegates.swift
//  TodoList
//
//  Created by 조중윤 on 2021/04/13.
//

import UIKit

class ToDoTableViewDelegates: NSObject {
    public var cardsToBeDone = CardsToBeDone()
    
    public func fetchCards(handler: @escaping () -> ()) {
        let urlString = Constants.url
        DataManager.requestGet(url: urlString) { (bool, output) in
            self.cardsToBeDone.list = output.todo
            handler()
        }
    }
}

extension ToDoTableViewDelegates: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardsToBeDone.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCardCell", for: indexPath) as! ToDoCardCell
        let cards = self.cardsToBeDone.list
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
        view.displayCurrentCardNumOnBadge(number: self.cardsToBeDone.list.count)
        
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
