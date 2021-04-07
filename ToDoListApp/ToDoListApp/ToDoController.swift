//
//  ToDoController.swift
//  ToDoListApp
//
//  Created by user on 2021/04/07.
//

import UIKit

class ToDoController: UIViewController {

    @IBOutlet weak var todoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCell()
    }
    
    func configureCell() {
        let nibName = UINib(nibName: "CardCell", bundle: nil)
        todoTableView.register(nibName, forCellReuseIdentifier: "cardCell")
        todoTableView.rowHeight = UITableView.automaticDimension
        todoTableView.estimatedRowHeight = 108
        todoTableView.separatorStyle = .none
        
    }

}

extension ToDoController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.systemGray6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todoTableView.dequeueReusableCell(withIdentifier: "cardCell") as! CardCell
        return cell
    }
}
