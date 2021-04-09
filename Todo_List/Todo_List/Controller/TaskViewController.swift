//
//  TaskViewController.swift
//  Todo_List
//
//  Created by 박혜원 on 2021/04/07.
//

import UIKit

class TaskViewController: UIViewController {
    
    let estimatedRowHeight : CGFloat = 108
    
    @IBOutlet weak var todo: UITableView!
    @IBOutlet weak var doing: UITableView!
    @IBOutlet weak var done: UITableView!
    
    @IBOutlet weak var countOfTodo: UILabel!
    @IBOutlet weak var countOfDoing: UILabel!
    @IBOutlet weak var countOfDone: UILabel!
    
    var taskManager = TaskVOManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpDelegate()
        registerNib()
        configureTextField()
    }
    @IBAction func todoPlus(_ sender: UIButton) {
    
        let storyboard = UIStoryboard(name: "Modal", bundle: nil)
        let viewcontroller = storyboard.instantiateViewController(identifier: "Modal") as! ModalViewController
        
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
// MARK: - Register Nib and Configuration
extension TaskViewController {
    func registerNib(){
        let nibName = UINib(nibName: "TaskCell", bundle: nil)
        
        /*각각 register 하여서 각 tableView마다 속성값을 관리할 수 있다.*/
        todo.register(nibName, forCellReuseIdentifier: "TaskCell")
        doing.register(nibName, forCellReuseIdentifier: "TaskCell")
        done.register(nibName, forCellReuseIdentifier: "TaskCell")
    }
    func configureTextField(){
        todo.rowHeight = UITableView.automaticDimension
        todo.estimatedRowHeight = estimatedRowHeight
        
        doing.rowHeight = UITableView.automaticDimension
        doing.estimatedRowHeight = estimatedRowHeight
        
        done.rowHeight = UITableView.automaticDimension
        done.estimatedRowHeight = estimatedRowHeight
    }
}
