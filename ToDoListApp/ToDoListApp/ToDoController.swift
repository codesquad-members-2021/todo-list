//
//  ToDoController.swift
//  ToDoListApp
//
//  Created by user on 2021/04/07.
//

import UIKit

class ToDoController: UIViewController {

    @IBOutlet weak var todoTableView: UITableView!
    
    private var todoDataSource = ToDoTableViewDataSource()
    private var todoDelegate = ToDoTableViewDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureDelegate()
        configureCell()
    }
    
    func configureDelegate() {
        todoTableView.delegate = todoDelegate
        todoTableView.dataSource = todoDataSource
    }
    
    func configureCell() {
        let nibName = UINib(nibName: "CardCell", bundle: nil)
        todoTableView.register(nibName, forCellReuseIdentifier: "cardCell")
        todoTableView.rowHeight = UITableView.automaticDimension
        todoTableView.estimatedRowHeight = 108
        todoTableView.separatorStyle = .none
    }

}

