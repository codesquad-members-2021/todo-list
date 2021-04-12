//
//  DoingViewController.swift
//  TodoList
//
//  Created by HOONHA CHOI on 2021/04/06.
//

import UIKit

class DoingViewController: UIViewController {
    
    @IBOutlet weak var doingTableView: UITableView!
    
    private let doingDataSource = DoingDataSource()
    private let doingDelegate = DoingDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        configure()
        setupUseCase()
    }
    
    func configure() {
        doingTableView.dataSource = doingDataSource
        doingTableView.delegate = self
        
        doingTableView.estimatedRowHeight = 108
        doingTableView.rowHeight = UITableView.automaticDimension
    }
    
    func setupUseCase() {
        DoingUseCase().loadDoingTask { tasks in
            self.doingDataSource.doingDTO.update(tasks: tasks)
            DispatchQueue.main.async { [weak self] in
                self?.doingTableView.reloadData()
            }
        }
    }
}

extension DoingViewController: UITableViewDelegate {
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
                let task = self.doingDataSource.doingDTO.move(index: indexPath.section)
                NotificationCenter.default.post(name: .taskCompleted, object: self, userInfo: ["task": task])
            }
            
            let rename = UIAction(title: "수정하기") { [weak self] action in
                // Perform update API
                guard let cell = tableView.cellForRow(at: indexPath) as? DoingTableViewCell else { return }
                guard let title = cell.title.text, let contents = cell.content.text, let storyboard = self?.storyboard, let vc = Router.shared.route(storyboard, title: title, contents: contents) else { return }
                self?.present(vc, animated: true, completion: nil)
            }
            
            let delete = UIAction(title: "삭제하기", attributes: .destructive) { [weak self] action in
                // Perform delete API
                self?.doingDataSource.doingDTO.delete(index: indexPath.section)
                tableView.deleteSections(IndexSet(indexPath.section...indexPath.section), with: .fade)
                tableView.reloadData()
            }
            
            return UIMenu(title: "", children: [share, rename, delete])
        }
    }
}
