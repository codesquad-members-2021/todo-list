//
//  DoViewController.swift
//  TodoList
//
//  Created by HOONHA CHOI on 2021/04/06.
//

import UIKit

class DoViewController: UIViewController {

    @IBOutlet weak var doTableView: UITableView!
    
    private let dataSource = DoDataSource()
    private let delegate = DoDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doTableView.dataSource = dataSource
        doTableView.delegate = delegate
        
        doTableView.estimatedRowHeight = 108
        doTableView.rowHeight = UITableView.automaticDimension
        
        DoingUseCase().loadDoTask { tasks in
            self.dataSource.tasks = tasks
            DispatchQueue.main.async { [weak self] in
                self?.doTableView.reloadData()
            }
        }
    }
    
    func configure() {
        doTableView.dataSource = dataSource
        doTableView.delegate = delegate
        
        doTableView.estimatedRowHeight = 108
        doTableView.rowHeight = UITableView.automaticDimension
    }
    
    func setupUseCase() {
        DoingUseCase().loadDoTask { tasks in
            self.dataSource.tasks = tasks
            DispatchQueue.main.async { [weak self] in
                self?.doTableView.reloadData()
            }
        }
    }
}


