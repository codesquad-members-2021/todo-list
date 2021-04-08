//
//  TodoTableViewController.swift
//  Todo_List
//
//  Created by 심영민 on 2021/04/06.
//

import UIKit

class TodoTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var columnNameLabel: UILabel!
    @IBOutlet weak var cardNumLabel: UILabel!
    
    private lazy var tableViewDelegate = TodoDelegate()
    private var todoDataSource = TodoDataSource()
    
    
    func setting() {
        tableView.delegate = tableViewDelegate
        tableView.register(UINib(nibName: TodoCell.identifier, bundle: nil), forCellReuseIdentifier: TodoCell.identifier)
        
    }
    
    func getData(with todoCards: TodoCardsManageable) {
        self.todoDataSource = TodoDataSource(todoCards: todoCards)
        tableView.dataSource = self.todoDataSource
    }
    
    func setHeader(columnName: String) {
        columnNameLabel.text = columnName
        cardNumLabel.text = "\(tableView.numberOfRows(inSection: 0))"
    }
}
