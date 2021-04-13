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
    
    private lazy var tableViewDelegate = TodoDelegate()
    var todoDataSource = TodoDataSource()
        
    func setting() {
        tableView.delegate = tableViewDelegate
        tableView.dropDelegate = self
        tableView.dragDelegate = self
        tableView.dragInteractionEnabled = true
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
    
    @IBAction func addCardButtonTouched(_ sender: UIButton) {
        let modalView = ModalViewController(nibName: "ModalViewController", bundle: nil)
        modalView.modalPresentationStyle = .custom
        self.present(modalView, animated: true, completion: nil)
        
    }
}
