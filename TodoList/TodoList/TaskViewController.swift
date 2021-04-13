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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        taskTableView.separatorStyle = .none
        taskTableView.estimatedRowHeight = 108
        taskTableView.rowHeight = UITableView.automaticDimension
        
        taskTableView.dataSource = dataSource
        taskTableView.delegate = self
        setupUseCase()
    }
    
    func setupUseCase() {
        DoingUseCase().loadTasks { tasks in
            if let ds = self.dataSource as? DoDataSource {
                let todos = tasks.filter { task in
                    task.category == .todo
                }
                ds.doDTO.update(tasks: todos)
            } else if let ds = self.dataSource as? DoingDataSource {
                let doings = tasks.filter { task in
                    task.category == .progress
                }
                ds.doingDTO.update(tasks: doings)
            } else if let ds = self.dataSource as? DoneDataSource {
                let dones = tasks.filter { task in
                    task.category == .done
                }
                ds.doneDTO.update(tasks: dones)
            }
            DispatchQueue.main.async { [weak self] in
                self?.taskTableView.reloadData()
            }
        }
    }
}

extension TaskViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let cellSpacingHeight: CGFloat = 15
        return cellSpacingHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
       if editingStyle == .delete {
       }
    } 
}
