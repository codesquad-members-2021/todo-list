//
//  CardViewController.swift
//  ToDoListApp
//
//  Created by user on 2021/04/08.
//

import UIKit

class CardViewController: UIViewController {

    @IBOutlet weak var toDoTableView: UITableView!
    @IBOutlet weak var inProgressTableView: UITableView!
    @IBOutlet weak var doneTableView: UITableView!
    
    
    private var cardManager = CardManager()
    
    private var todoDataSource = ToDoTableViewDataSource()
    private var todoDelegate = ToDoTableViewDelegate()
    private var inProgressDataSource = InProgressTableViewDataSource()
    private var inProgressDelegate = InProgressTableViewDelegate()
    private var doneDataSource = DoneTableViewDataSource()
    private var doneDelegate = DoneTableViewDelegate()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureDelegate()
        
    }
    
    func configureDelegate() {
        toDoTableView.delegate = todoDelegate
        todoDataSource.delegate = cardManager
        toDoTableView.dataSource = todoDataSource
        
        inProgressTableView.delegate = inProgressDelegate
        inProgressDataSource.delegate = cardManager
        inProgressTableView.dataSource = inProgressDataSource
        
        
        doneTableView.delegate = doneDelegate
        doneDataSource.delegate = cardManager
        doneTableView.dataSource = doneDataSource
    }

}
