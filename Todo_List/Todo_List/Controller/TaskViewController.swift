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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
    }
    
}

extension TaskViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch tableView {
        case todo:
            return 3
        case doing:
            return 4
        case done:
            return 1
        default:
            return 0
        }
        
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell") as! TaskCell
        
        
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        
        
        //indexPath.row + 1 (이유 = 0 부터 시작하므로)
        switch tableView {
        case todo:
            countOfTodo.text = String(indexPath.row + 1)
        case doing:
            countOfDoing.text = String(indexPath.row + 1)
        case done:
            countOfDone.text = String(indexPath.row + 1)            
        default: break
            
        }                
        
        return cell
        
    }
}
