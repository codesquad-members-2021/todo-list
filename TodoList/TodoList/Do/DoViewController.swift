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
            
            let rename = UIAction(title: "수정하기") { [weak self] action in
                guard let cell = tableView.cellForRow(at: indexPath) as? DoTableViewCell else { return }
                guard let title = cell.title.text, let contents = cell.content.text, let storyboard = self?.storyboard, let vc = Router.shared.route(storyboard, title: title, contents: contents) else { return }
                self?.present(vc, animated: true, completion: nil)
            }
            
            let delete = UIAction(title: "삭제하기", attributes: .destructive) { [weak self] action in
                // Perform delete API
                self?.dataSource.doDTO.delete(index: indexPath.section)
                tableView.deleteSections(IndexSet(indexPath.section...indexPath.section), with: .fade)
                tableView.reloadData()
            }
            
            return UIMenu(title: "", children: [share, rename, delete])
        }
    }
}

extension Notification.Name {
    static let taskCompleted = Notification.Name(rawValue: "taskCompleted")
}
