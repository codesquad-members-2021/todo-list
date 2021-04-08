//
//  DoingViewController.swift
//  TodoList
//
//  Created by HOONHA CHOI on 2021/04/06.
//

import UIKit

class DoingViewController: UIViewController {
    
    @IBOutlet weak var doingTableView: UITableView!
    
    private let doingDataSource = DoingDataSource()
    private let doingDelegate = DoingDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        doingTableView.dataSource = doingDataSource
        doingTableView.delegate = doingDelegate
        
        doingTableView.estimatedRowHeight = 108
        doingTableView.rowHeight = UITableView.automaticDimension
        
        DoingUseCase().loadDoingTask { tasks in
            self.doingDataSource.tasks = tasks
            DispatchQueue.main.async { [weak self] in
                self?.doingTableView.reloadData()
            }
        }
    }
}

