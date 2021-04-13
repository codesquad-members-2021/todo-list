//
//  DoneViewController.swift
//  TodoList
//
//  Created by 조중윤 on 2021/04/08.
//

import UIKit

class DoneViewController: UIViewController {
    let doneTableViewDelegates = DoneTableViewDelegates()
    
    @IBOutlet weak var doneCardTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(doneCardsListHasBeenChanged), name: .didChangeCompletedCardsLists, object: nil)
        
        self.doneCardTableView.dataSource = doneTableViewDelegates
        self.doneCardTableView.delegate = doneTableViewDelegates
        self.doneCardTableView.rowHeight = 150
        
        self.doneCardTableView.register(UINib(nibName: "ToDoCardCell", bundle: nil), forCellReuseIdentifier: "ToDoCardCell")
        doneCardTableView.register(CustomHeader.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
        
        doneTableViewDelegates.fetchCards()
    }
    
    @objc func doneCardsListHasBeenChanged() {
        DispatchQueue.main.async {
            self.doneCardTableView.reloadData()
        }
    }
}
