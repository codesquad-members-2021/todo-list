//
//  SideMenuTableViewDatasource.swift
//  todo-list
//
//  Created by Song on 2021/04/14.
//

import UIKit

class SideMenuTableViewDataSource: NSObject, UITableViewDataSource {
    
    private let taskManager: TaskManager
    
    init(taskManager: TaskManager) {
        self.taskManager = taskManager
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskManager.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sideMenuCell", for: indexPath) as! SideMenuTableViewCell
        
        let task = taskManager.taskAt(index: indexPath.row)
        
        cell.nicknameLabel.text = task.nickname
        cell.taskLabel.text = task.content
        cell.timeLabel.text = TimeMaker.timeStringFrom(date: task.time)
        
        return cell
    }

}
