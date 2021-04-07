//
//  TodoTableViewController.swift
//  Todo_List
//
//  Created by 심영민 on 2021/04/06.
//

import UIKit

class TodoTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private lazy var tableViewDelegate = TodoDelegate()
    private var todoDataSource = TodoDataSource()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setting()
    }
    
    private func setting() {
        tableView.dataSource = todoDataSource
        tableView.delegate = tableViewDelegate
        tableView.register(UINib(nibName: TodoCell.identifier, bundle: nil), forCellReuseIdentifier: TodoCell.identifier)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
    }
}
