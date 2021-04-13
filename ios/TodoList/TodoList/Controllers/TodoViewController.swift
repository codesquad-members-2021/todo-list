//
//  firstChildViewController.swift
//  TodoList
//
//  Created by 조중윤 on 2021/04/07.
//

import UIKit

class ToDoViewController: UIViewController {
    let toDoTableViewDelegates = ToDoTableViewDelegates()
    
    @IBOutlet weak var toDoCardTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(toDoCardsListHasBeenChanged), name: .didChangeToDoCardsList, object: nil)
        
        self.toDoCardTableView.dataSource = toDoTableViewDelegates
        self.toDoCardTableView.delegate = toDoTableViewDelegates
        self.toDoCardTableView.rowHeight = 150
        
        self.toDoCardTableView.register(UINib(nibName: "ToDoCardCell", bundle: nil), forCellReuseIdentifier: "ToDoCardCell")
        toDoCardTableView.register(CustomHeader.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
        
        toDoTableViewDelegates.fetchCards()
    }
    
    @objc func toDoCardsListHasBeenChanged() {
        DispatchQueue.main.async {
            self.toDoCardTableView.reloadData()
        }
    }
}




