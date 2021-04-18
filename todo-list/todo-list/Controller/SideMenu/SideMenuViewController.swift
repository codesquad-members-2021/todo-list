//
//  SideMenuViewController.swift
//  todo-list
//
//  Created by Song on 2021/04/08.
//

import UIKit

class SideMenuViewController: UIViewController {
    
    @IBOutlet weak var sideMenuTableView: UITableView!
    
    private var sideMenuTableViewDataSource: UITableViewDataSource?
    private var sideMenuTableViewDelegate: UITableViewDelegate?
    private var customTransitionDelegate = SideMenuTransitionDelegate()
    
    private let taskManager: TaskManager?
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, taskList: TaskManager) {
        self.taskManager = taskList
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        modalPresentationStyle = .custom
        transitioningDelegate = customTransitionDelegate
    }
    
    required init?(coder: NSCoder) {
        self.taskManager = nil
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibName = UINib(nibName: "SideMenuTableViewCell", bundle: .none)
        sideMenuTableView.register(nibName, forCellReuseIdentifier: "sideMenuCell")
        
        sideMenuTableViewDataSource = SideMenuTableViewDataSource(taskManager: taskManager!)
        sideMenuTableViewDelegate = SideMenuTableViewDelegate()
        
        sideMenuTableView.dataSource = sideMenuTableViewDataSource
        sideMenuTableView.delegate = sideMenuTableViewDelegate
    }
    
    @IBAction func closeButtonTouched(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
