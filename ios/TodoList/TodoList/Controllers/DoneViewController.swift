//
//  DoneViewController.swift
//  TodoList
//
//  Created by 조중윤 on 2021/04/08.
//

import UIKit

class DoneViewController: UIViewController {
    @IBOutlet weak var doneCardTableView: UITableView!
    var cards: [ToDoItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.doneCardTableView.register(UINib(nibName: "ToDoCardCell", bundle: nil), forCellReuseIdentifier: "ToDoCardCell")
        self.doneCardTableView.dataSource = self
        self.doneCardTableView.delegate = self
        self.doneCardTableView.rowHeight = 150
        
        fetchCards()
        
        doneCardTableView.register(CustomHeader.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
    }
    
    func fetchCards() {
        let urlString = Constants.url
        DataManager.request(urlString, "GET") { (bool, output) in
            
            self.cards = output.done
            DispatchQueue.main.async {
                self.doneCardTableView.reloadData()
            }
        }
    }
}

extension DoneViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(cards.count)
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

extension DoneViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
            viewForHeaderInSection section: Int) -> UIView? {
       let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                   "sectionHeader") as! CustomHeader
       view.title.text = "완료한 일"
        view.displayCurrentCardNumOnBadge(number: self.cards.count)
        view.button.addAction(UIAction.init(handler: { (touch) in
            print("touched")
        }), for: .touchUpInside)
       return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        CGFloat(50)
    }
}

