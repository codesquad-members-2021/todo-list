//
//  DoViewController.swift
//  TodoList
//
//  Created by HOONHA CHOI on 2021/04/06.
//

import UIKit

class DoViewController: UIViewController {

    @IBOutlet weak var doTableView: UITableView!
    
    private let dataSource = DoDataSource()
    private let delegate = DoDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setupUseCase()
    }
    
    func configure() {
        doTableView.dataSource = dataSource
        doTableView.delegate = self
        
        doTableView.estimatedRowHeight = 108
        doTableView.rowHeight = UITableView.automaticDimension
    }
    
    func setupUseCase() {
        DoingUseCase().loadDoTask { tasks in
            self.dataSource.doDTO.update(tasks: tasks)
            DispatchQueue.main.async { [weak self] in
                self?.doTableView.reloadData()
            }
        }
    }
}

extension DoViewController : UITableViewDelegate {
    
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
    
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { suggestedActions in
            
            let share = UIAction(title: "완료한 일로 이동") { action in
                let task = self.dataSource.doDTO.move(index: indexPath.section)
                NotificationCenter.default.post(name: .taskCompleted, object: self, userInfo: ["task": task])
            }
            
            let rename = UIAction(title: "수정하기") { action in
                // Perform renaming
            }
            
            let delete = UIAction(title: "삭제하기", attributes: .destructive) { action in
                // Perform delete
            }
            
            return UIMenu(title: "", children: [share, rename, delete])
        }
    }
}

extension Notification.Name {
    static let taskCompleted = Notification.Name(rawValue: "taskCompleted")
}
