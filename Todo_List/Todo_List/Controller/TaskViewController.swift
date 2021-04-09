//
//  TaskViewController.swift
//  Todo_List
//
//  Created by 박혜원 on 2021/04/07.
//

import UIKit

class TaskViewController: UIViewController {
    
    @IBOutlet weak var todo: UITableView!
    @IBOutlet weak var doing: UITableView!
    @IBOutlet weak var done: UITableView!
    
    @IBOutlet weak var countOfTodo: UILabel!
    @IBOutlet weak var countOfDoing: UILabel!
    @IBOutlet weak var countOfDone: UILabel!
    
    var taskManager = TaskVOManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todo.rowHeight = UITableView.automaticDimension
        todo.estimatedRowHeight = 108
        todo.delegate = self
        todo.dataSource = self
        
        doing.delegate = self
        doing.dataSource = self
        
        done.delegate = self
        done.dataSource = self
        
        let nibName = UINib(nibName: "TaskCell", bundle: nil)
        
        /*각각 register 하여서 각 tableView마다 속성값을 관리할 수 있다.*/
        todo.register(nibName, forCellReuseIdentifier: "TaskCell")
        doing.register(nibName, forCellReuseIdentifier: "TaskCell")
        done.register(nibName, forCellReuseIdentifier: "TaskCell")
        
        taskManager.apepnd(with: TaskVO(), type: .todo)
    }
    @IBAction func todoPlus(_ sender: UIButton) {
    
        let storyboard = UIStoryboard(name: "PopUp", bundle: nil)
        let viewcontroller = storyboard.instantiateViewController(identifier: "AddPopUp") as! AddPopUpViewController
        
        viewcontroller.definesPresentationContext = true
        viewcontroller.modalPresentationStyle = .formSheet
        self.present(viewcontroller, animated: true)
        
        viewcontroller.setHandler { [weak self] task in
            self?.taskManager.apepnd(with: task, type: .todo)
            self?.todo.reloadData()
        }
        
    }
    @IBAction func doingPlus(_ sender: UIButton) {
        taskManager.apepnd(with: TaskVO(), type: .doing)
        doing.reloadData()
    }
    @IBAction func donePlus(_ sender: UIButton) {
        taskManager.apepnd(with: TaskVO(), type: .done)
        done.reloadData()
    }
    
}

extension TaskViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1 //각 섹션에는 한개의 row만 존재한다.
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
        return 20
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
