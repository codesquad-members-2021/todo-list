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
        self.toDoCardTableView.register(UINib(nibName: "ToDoCardCell", bundle: nil), forCellReuseIdentifier: "ToDoCardCell")
        self.toDoCardTableView.dataSource = toDoTableViewDelegates
        self.toDoCardTableView.delegate = toDoTableViewDelegates as? UITableViewDelegate
        self.toDoCardTableView.rowHeight = 150
        
        toDoCardTableView.register(CustomHeader.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
        toDoTableViewDelegates.fetchCards(handler: {
            DispatchQueue.main.async {
                self.toDoCardTableView.reloadData()
            }
        })
    }
}




