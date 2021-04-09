//
//  TaskViewController+Data.swift
//  Todo_List
//
//  Created by 박혜원 on 2021/04/09.
//

import UIKit

// MARK:- delegation set up
extension TaskViewController {
    func setUpDelegate(){
        todo.delegate = self
        todo.dataSource = self
        
        doing.delegate = self
        doing.dataSource = self
        
        done.delegate = self
        done.dataSource = self
    }
}
extension TaskViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskViewConstant.numberOfRowsInSection //각 섹션에는 한개의 row만 존재한다.
    }
    /*섹션의 수를 늘리는 프로토콜*/
    func numberOfSections(in tableView: UITableView) -> Int {
        var count = 0
        switch tableView {
        case todo:
            count = taskManager.todoList.count
            countOfTodo.text = String(count)
        case doing:
            count = taskManager.doingList.count
            countOfDoing.text = String(count)
        case done:
            count = taskManager.doneList.count
            countOfDone.text = String(count)
        default:
            break
        }
        return count
    }
    
    /*섹션의 헤더섹션 배경색을 바꾸는 법.*/
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.9607843137, alpha: 1)
    }
    
    /*섹션의 헤더섹션 사이즈를 늘리는 방법.*/
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return TaskViewConstant.heightForHeaderInSection
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell") as! TaskCell
        
        var task : TaskVO
        switch tableView {
        case todo:
            task = taskManager.todoList[indexPath.section]
        case doing:
            task = taskManager.doingList[indexPath.section]
        case done:
            task = taskManager.doneList[indexPath.section]
        default:
            return cell
        }
        cell.title.text = task.title
        cell.content.text = task.content
        cell.writer.text = task.writer
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     
        switch tableView {
        case todo:
            taskManager.remove(at: indexPath.section, type: .todo)
            todo.deleteSections([indexPath.section], with: .fade)
        case doing:
            taskManager.remove(at: indexPath.section, type: .doing)
            doing.deleteSections([indexPath.section], with: .fade)
        case done:
            taskManager.remove(at: indexPath.section, type: .done)
            done.deleteSections([indexPath.section], with: .fade)
        default:
            return
        }
    }
}
