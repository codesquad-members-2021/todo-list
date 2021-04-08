//
//  ViewController.swift
//  TodoApp
//
//  Created by 김지선 on 2021/04/08.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var TodoTableView: UITableView!
    @IBOutlet weak var InProgressTableView: UITableView!
    @IBOutlet weak var DoneTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTaskCell()
        // Do any additional setup after loading the view.
    }

    private func registerTaskCell(){
        TodoTableView.register(UINib(nibName: "TaskCell", bundle: nil), forCellReuseIdentifier: "TaskCell")
        InProgressTableView.register(UINib(nibName: "TaskCell", bundle: nil), forCellReuseIdentifier: "TaskCell")
        DoneTableView.register(UINib(nibName: "TaskCell", bundle: nil), forCellReuseIdentifier: "TaskCell")
    }

}

