//
//  TaskViewController.swift
//  TodoApp
//
//  Created by 김지선 on 2021/04/08.
//

import UIKit

class TaskViewController: UIViewController {

    var id: Int?
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var taskCountLabel: UILabel!
    @IBOutlet weak var taskTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitleLabel()
        setupTaskCountLable()
    }
    
    // Custom
    private func setupTitleLabel() {
        guard let id = id else { return }
        let titles: [Int: String] = [
            StatusValue.toDo: StatusInfo.toDo,
            StatusValue.inProgress: StatusInfo.inProgress,
            StatusValue.done:StatusInfo.done]
        
        titleLabel.text = titles[id]
    }
    
    private func setupTaskCountLable() {
        taskCountLabel.layer.cornerRadius = taskCountLabel.layer.frame.width / 2
        taskCountLabel.layer.masksToBounds = true
    }
    
    //Register Xib
    private func registerTaskCell() {
        taskTableView.register(UINib(nibName: "TaskCell", bundle: nil), forCellReuseIdentifier: "TaskCell")
    }
}
