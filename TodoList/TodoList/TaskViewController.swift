//
//  TaskViewController.swift
//  TodoList
//
//  Created by Ador on 2021/04/13.
//

import UIKit

class TaskViewController: UIViewController {
    @IBOutlet weak var taskTableView: UITableView!
    
    var dataSource: UITableViewDataSource?
    var delegate: UITableViewDelegate?
    private var taskDTO = TaskDTO()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskTableView.separatorStyle = .none
        taskTableView.estimatedRowHeight = 108
        taskTableView.rowHeight = UITableView.automaticDimension
        
        taskTableView.dataSource = dataSource
        taskTableView.delegate = delegate
        setupUseCase()
    }
    
    func setupUseCase() {
        UseCase().loadTasks { [weak self] tasks in
            self?.taskDTO.filter(tasks: tasks)
            if let dataSource = self?.dataSource as? DoDataSource {
                dataSource.doDTO.update(tasks: self?.taskDTO.todos ?? [])
            } else if let dataSource = self?.dataSource as? DoingDataSource {
                dataSource.doingDTO.update(tasks: self?.taskDTO.doing ?? [])
            } else if let dataSource = self?.dataSource as? DoneDataSource {
                dataSource.doneDTO.update(tasks: self?.taskDTO.done ?? [])
            }
            DispatchQueue.main.async { [weak self] in
                self?.taskTableView.reloadData()
            }
        }
    }
}


