//
//  DoingViewController.swift
//  TodoList
//
//  Created by HOONHA CHOI on 2021/04/06.
//

import UIKit

class DoingViewController: UIViewController {

    
    @IBOutlet weak var DoingTableView: UITableView!
    
    private let doingDataSource = DoingDataSource()
    private let doingDelegate = DoingDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        DoingTableView.dataSource = doingDataSource
        DoingTableView.delegate = doingDelegate
        
        DoingTableView.estimatedRowHeight = 108
        DoingTableView.rowHeight = UITableView.automaticDimension
        
    }
}

