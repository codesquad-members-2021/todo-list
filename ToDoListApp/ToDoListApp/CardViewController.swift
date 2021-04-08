//
//  CardViewController.swift
//  ToDoListApp
//
//  Created by user on 2021/04/08.
//

import UIKit

class CardViewController: UIViewController {

    @IBOutlet weak var toDoTableView: UITableView!
    @IBOutlet weak var inProgressTableView: UITableView!
    @IBOutlet weak var doneTableView: UITableView!
    
    private var todoDataSource = ToDoTableViewDataSource()
    private var todoDelegate = ToDoTableViewDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureDelegate()
        
    }
    
    func configureDelegate() {
        toDoTableView.delegate = todoDelegate
        toDoTableView.dataSource = todoDataSource
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
