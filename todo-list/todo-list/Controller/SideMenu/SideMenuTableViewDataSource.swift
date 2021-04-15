//
//  SideMenuTableViewDatasource.swift
//  todo-list
//
//  Created by Song on 2021/04/14.
//

import UIKit

class SideMenuTableViewDataSource: NSObject, UITableViewDataSource {
    
    private let taskManager: TaskFinddable
    
    init(taskManager: TaskFinddable) {
        self.taskManager = taskManager
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskManager.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sideMenuCell", for: indexPath) as! SideMenuTableViewCell
        
        let idx = taskManager.count() - indexPath.row - 1
        let task = taskManager.taskAt(index: idx)
        
        cell.nicknameLabel.text = task.nickname
        let content = NSMutableAttributedString().makeString(of: task.content, separator: "%")
        cell.taskLabel.attributedText = content
        cell.timeLabel.text = TimeMaker.timeStringFrom(date: task.time)
        
        return cell
    }

}
