//
//  DoingTableViewDelegates.swift
//  TodoList
//
//  Created by 조중윤 on 2021/04/13.
//

import UIKit

class DoingTableViewDelegates: NSObject {
    public var cardsOnProgress = CardsOnProgress()
    
    public func fetchCards(handler: @escaping () -> ()) {
        let urlString = Constants.url
        DataManager.requestGet(url: urlString) { (bool, output) in
            self.cardsOnProgress.list = output.doing
            handler()
        }
    }
}

extension DoingTableViewDelegates: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardsOnProgress.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCardCell", for: indexPath) as! ToDoCardCell
        let cards = self.cardsOnProgress.list
        cell.titleLabel.text = cards[indexPath.row].title
        cell.contentLabel.text = cards[indexPath.row].contents
        cell.authorLabel.text = "author by \(cards[indexPath.row].id)"
        
        return cell
    }
}

extension DoingTableViewDelegates: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
            viewForHeaderInSection section: Int) -> UIView? {
       let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                   "sectionHeader") as! CustomHeader
       view.title.text = "진행중인 일"
        view.displayCurrentCardNumOnBadge(number: self.cardsOnProgress.list.count)
        view.button.addAction(UIAction.init(handler: { (touch) in
            DataManager.requestDelete(url: Constants.url, id: "2") { (success, output) in
                print(output)
            }
        }), for: .touchUpInside)
       return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        CGFloat(50)
    }
}
