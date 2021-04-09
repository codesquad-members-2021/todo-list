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
        self.toDoCardTableView.rowHeight = 150
        
        fetchCards()
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




