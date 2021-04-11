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
    
    var todoTasks = [TaskVO]()
    var doingTasks = [TaskVO]()
    var doneTasks = [TaskVO]()
            
    var CELL_SPACING_SIZE = 16
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todo.rowHeight = UITableView.automaticDimension
        todo.estimatedRowHeight = 108
        todo.delegate = self
        todo.dataSource = self
        todo.dragDelegate = self
        todo.dropDelegate = self
        todo.dragInteractionEnabled = true
        
        doing.delegate = self
        doing.dataSource = self
        doing.dragDelegate = self
        doing.dropDelegate = self
        doing.dragInteractionEnabled = true
        
        
        done.delegate = self
        done.dataSource = self
        done.dragDelegate = self
        done.dropDelegate = self
        done.dragInteractionEnabled = true
        
        
        let nibName = UINib(nibName: "TaskCell", bundle: nil)
        
        /*각각 register 하여서 각 tableView마다 속성값을 관리할 수 있다.*/
        todo.register(nibName, forCellReuseIdentifier: "TaskCell")
        doing.register(nibName, forCellReuseIdentifier: "TaskCell")
        done.register(nibName, forCellReuseIdentifier: "TaskCell")
        
        todoTasks.append(TaskVO()) // todo에 하나를 넣었다.
        
        
    }
    @IBAction func todoPlus(_ sender: UIButton) {
        
        let new = TaskVO(title: "Test", content: "drag&Drop", writer: "jackson") //기존 task init과 다르게 입력해서 실제로 이동하는지를 체크하고 싶어서 설정함.
        todoTasks.insert(new, at: 0)
        todo.reloadData()
    }
    @IBAction func doingPlus(_ sender: UIButton) {
        let new = TaskVO()
        doingTasks.insert(new, at: 0)
        doing.reloadData()
    }
    @IBAction func donePlus(_ sender: UIButton) {
        let new = TaskVO()
        doneTasks.insert(new, at: 0)
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
            count = todoTasks.count
            countOfTodo.text = String(count)
        case doing:
            count = doingTasks.count
            countOfDoing.text = String(count)
        case done:
            count = doneTasks.count
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
        CGFloat(CELL_SPACING_SIZE)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell") as! TaskCell
        
        var task : TaskVO
        switch tableView {
        case todo:
            task = todoTasks[indexPath.section]
        case doing:
            task = doingTasks[indexPath.section]
        case done:
            task = doneTasks[indexPath.section]
        default:
            return cell
        }
        cell.title.text = task.title
        cell.content.text = task.content
        cell.writer.text = task.writer
        
        return cell
        
    }
    
    /*각 셀을 swipe-left로 삭제할 수 있는 프로토콜*/
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     
        switch tableView {
        case todo:
            todoTasks.remove(at: indexPath.section)
            todo.deleteSections([indexPath.section], with: .fade)
        case doing:
            doingTasks.remove(at: indexPath.section)
            doing.deleteSections([indexPath.section], with: .fade)
        case done:
            doneTasks.remove(at: indexPath.section)
            done.deleteSections([indexPath.section], with: .fade)
        default:
            return
        }
    }
    
    /*각 테이블 내부에서 섹션을 변경할수 있는 프로토콜 */
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        print("sourceIndexPath : ",sourceIndexPath, "destinationIndexPath : ",destinationIndexPath)
        tableView.moveSection(sourceIndexPath.section, toSection: destinationIndexPath.section)
    }
}
