//
//  DoneViewController.swift
//  TodoList
//
//  Created by HOONHA CHOI on 2021/04/06.
//

import UIKit

class DoneViewController: UIViewController {
    @IBOutlet weak var doneTableView: UITableView!
    
    private let doneDataSource = DoneDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        NotificationCenter.default.addObserver(self, selector: #selector(completeTask(_:)), name: .taskCompleted, object: nil)
    }
    
    private func configure() {
        doneTableView.dataSource = doneDataSource
        doneTableView.delegate = self
        
        doneTableView.estimatedRowHeight = 108
        doneTableView.rowHeight = UITableView.automaticDimension
    }
    
    @objc func completeTask(_ notifification: Notification) {
        guard let task = notifification.userInfo?["task"] as? Task else {
            return
        }
        doneDataSource.doneDTO.insert(task: task)
        doneTableView.reloadData()
    }
}

extension DoneViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let cellSpacingHeight: CGFloat = 15
        return cellSpacingHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
        }
    }
}
