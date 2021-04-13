//
//  DoingViewController.swift
//  TodoList
//
//  Created by 조중윤 on 2021/04/08.
//

import UIKit

class DoingViewController: UIViewController {
    let doingTableViewDelegates = DoingTableViewDelegates()
    
    @IBOutlet weak var doingCardTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(doingCardsListHasBeenChanged), name: .didChangeDoingCardsList, object: nil)
        
        self.doingCardTableView.dataSource = doingTableViewDelegates
        self.doingCardTableView.delegate = doingTableViewDelegates
        self.doingCardTableView.rowHeight = 150
        
        self.doingCardTableView.register(UINib(nibName: "ToDoCardCell", bundle: nil), forCellReuseIdentifier: "ToDoCardCell")
        doingCardTableView.register(CustomHeader.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
        
        doingTableViewDelegates.fetchCards()
    }
    
    @objc func doingCardsListHasBeenChanged() {
        DispatchQueue.main.async {
            self.doingCardTableView.reloadData()
        }
    }
}
