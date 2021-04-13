//
//  DoneTableViewDelegates.swift
//  TodoList
//
//  Created by 조중윤 on 2021/04/13.
//

import UIKit

class DoneTableViewDelegates: NSObject {
    public var cardsCompleted = CardsCompleted()
    
    public func fetchCards(handler: @escaping () -> ()) {
        let urlString = Constants.url
        DataManager.requestGet(url: urlString) { (bool, output) in
            self.cardsCompleted.list = output.done
            handler()
        }
    }
}

extension DoneTableViewDelegates: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardsCompleted.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCardCell", for: indexPath) as! ToDoCardCell
        cell.titleLabel.text = cardsCompleted.list[indexPath.row].title
        cell.contentLabel.text = cardsCompleted.list[indexPath.row].contents
        cell.authorLabel.text = "author by \(cardsCompleted.list[indexPath.row].id)"
        
        return cell
    }
}

extension DoneTableViewDelegates: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
            viewForHeaderInSection section: Int) -> UIView? {
       let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                   "sectionHeader") as! CustomHeader
       view.title.text = "완료한 일"
        view.displayCurrentCardNumOnBadge(number: self.cardsCompleted.list.count)
        view.button.addAction(UIAction.init(handler: { (touch) in
            print("touched")
        }), for: .touchUpInside)
       return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        CGFloat(50)
    }
}
