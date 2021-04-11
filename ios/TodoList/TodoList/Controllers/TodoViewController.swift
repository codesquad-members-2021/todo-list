//
//  firstChildViewController.swift
//  TodoList
//
//  Created by 조중윤 on 2021/04/07.
//

import UIKit

class ToDoViewController: UIViewController {
    @IBOutlet weak var toDoCardTableView: UITableView!
    var cards: [ToDoItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.toDoCardTableView.register(UINib(nibName: "ToDoCardCell", bundle: nil), forCellReuseIdentifier: "ToDoCardCell")
        self.toDoCardTableView.dataSource = self
        self.toDoCardTableView.delegate = self
        self.toDoCardTableView.rowHeight = 150
        
        fetchCards()
        
        toDoCardTableView.register(CustomHeader.self,
               forHeaderFooterViewReuseIdentifier: "sectionHeader")
    }
    
    func fetchCards() {
        let urlString = Constants.url
        DataManager.getData(urlString: urlString) { (toDoList) in
            guard let safeToDoList = toDoList else { return }
            
            self.cards = safeToDoList.todo
            DispatchQueue.main.async {
                self.toDoCardTableView.reloadData()
            }
        }
    }
}

extension ToDoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCardCell", for: indexPath) as! ToDoCardCell
        cell.titleLabel.text = cards[indexPath.row].title
        cell.contentLabel.text = cards[indexPath.row].contents
        cell.authorLabel.text = "author by \(cards[indexPath.row].id)"
        
        return cell
    }
}

extension ToDoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
            viewForHeaderInSection section: Int) -> UIView? {
       let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                   "sectionHeader") as! CustomHeader
       view.title.text = "해야 할 일"
        view.button.addAction(UIAction.init(handler: { (touch) in
            print("touched")
        }), for: .touchUpInside)
       return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        CGFloat(50)
    }
}




