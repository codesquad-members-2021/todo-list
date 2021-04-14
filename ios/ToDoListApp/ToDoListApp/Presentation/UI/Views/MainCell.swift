//
//  MainCell.swift
//  ToDoListApp
//
//  Created by zombietux on 2021/04/07.
//

import UIKit

class MainCell: UICollectionViewCell {
    static let identifier = "MainCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var boardCountLabel: UILabel!
    @IBOutlet weak var inputButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    private var cardViewModel: CardViewModel?
    private var column: Int!
    private var tableViewDelegate: TableViewDelegate!
    private var tableViewDragDelegate: TableViewDragDelegate!
    private var tableViewDataSource: UITableViewDataSource!
    
    func setup(with cardViewModel: CardViewModel, column: Int) {
        self.cardViewModel = cardViewModel
        self.column = column
        self.tableViewDelegate = TableViewDelegate(cardViewModel: cardViewModel, column: column)
        self.tableViewDataSource = TableViewDataSource(cardViewModel: cardViewModel, column: column)
        self.tableViewDragDelegate = TableViewDragDelegate()
        
        tableView.delegate = self.tableViewDelegate
        tableView.dragInteractionEnabled = true
        tableView.dragDelegate = tableViewDragDelegate
        tableView.dropDelegate = tableViewDragDelegate
        tableView.dataSource = tableViewDataSource
        tableView.reloadData()
    }
}
