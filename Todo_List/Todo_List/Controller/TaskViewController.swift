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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        todo.delegate = self
        todo.dataSource = self
        
        let nibName = UINib(nibName: "TaskCell", bundle: nil)
        todo.register(nibName, forCellReuseIdentifier: "TaskCell")
    
    }

}

extension TaskViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todo.dequeueReusableCell(withIdentifier: "TaskCell") as! TaskCell
        return cell
    }
}
