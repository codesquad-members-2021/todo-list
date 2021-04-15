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
    @IBOutlet weak var addCardButton: UIButton!
    
    private (set)var column : String!
    private lazy var tableViewDelegate = TodoDelegate()
    var todoDataSource = TodoDataSource(todoCards: [])
        
    
    // MARK:- Method
    
    func setting() {
        tableView.delegate = tableViewDelegate
        tableView.dropDelegate = self
        tableView.dragDelegate = self
        tableView.dragInteractionEnabled = true
        tableView.register(UINib(nibName: TodoCell.identifier, bundle: nil), forCellReuseIdentifier: TodoCell.identifier)
        
    }
    
    func setData(with todoCards: [TodoCard], column: String) {
        self.todoDataSource = TodoDataSource(todoCards: todoCards)
        tableView.dataSource = self.todoDataSource
        self.column = column
    }
    
    func setHeader(columnName: String) {
        columnNameLabel.text = columnName
    }
    
    func reload() {
        self.tableView.reloadData()
        cardNumLabel.text = "\(todoDataSource.todoCards.count)"
    }
    
    @IBAction func addCardButtonTouched(_ sender: UIButton) {
        let modalView = ModalViewController(nibName: "ModalViewController", bundle: nil, self.todoDataSource.todoCards, status: self.column)
        modalView.modalPresentationStyle = .custom
        self.present(modalView, animated: true, completion: nil)        
    }
    
}
