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
            switch self?.dataSource {
            case is DoDataSource:
                DoDTO.shared.update(tasks: self?.taskDTO.todos ?? [])
            case is DoingDataSource:
                DoingDTO.shared.update(tasks: self?.taskDTO.doing ?? [])
            case is DoneDataSource:
                DoneDTO.shared.update(tasks: self?.taskDTO.done ?? [])
            default:
                break
            }
            DispatchQueue.main.async { [weak self] in
                self?.taskTableView.reloadData()
            }
        }
    }
}


