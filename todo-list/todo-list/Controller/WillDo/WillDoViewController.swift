//
//  WillDoViewController.swift
//  todo-list
//
//  Created by sonjuhyeong on 2021/04/07.
//

import UIKit

class WillDoViewController: UIViewController {
    
    @IBOutlet weak var badgeView: UIView!
    @IBOutlet weak var badgeLabel: UILabel!
    
    private var cellCount = 0
    
    @IBOutlet weak var willDoTableView: UITableView!
    private let dataSource = WillDoTableViewDataSource()
    
    private var cardMargin: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        willDoTableView.dataSource = dataSource
        willDoTableView.delegate = self
        let nibName = UINib(nibName: "ToDoTableViewCell", bundle: .none)
        willDoTableView.register(nibName, forCellReuseIdentifier: "tableCell")
        
        setBadgeViewRadius()
        updateTableView()
        loadData()
        
        willDoTableView.register(CardMargin.self, forHeaderFooterViewReuseIdentifier: "cardMargin")
        cardMargin = 8
    }
    
    @IBAction func addButtonTouched(_ sender: Any) {
        cellCount += 1
        updateTableView()
        
        let addToDoVC = AddToDoViewController(nibName: "AddToDoViewController", bundle: .none)
        addToDoVC.modalPresentationStyle = .formSheet
        addToDoVC.preferredContentSize = CGSize(width: 400, height: 175)
        self.present(addToDoVC, animated: true, completion: nil)
    }
    
    private func setBadgeViewRadius() {
        let radius = badgeView.bounds.height * 0.5
        badgeView.layer.cornerRadius = radius
    }
    
    private func updateTableView() {
        badgeLabel.text = "\(cellCount)"
        willDoTableView.reloadData()
    }
    
    private func loadData() {
        DataTaskManager.request(completion: { (result) in
            switch result {
            case .success(let data):
                self.dataSource.cardList = data
                DispatchQueue.main.async { [weak self] in
                    self?.willDoTableView.reloadData()
                }
            case.failure(let error):
                print(error.localizedDescription)
            }
        })
    }
}

extension WillDoViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "cardMargin") as! CardMargin
        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "cardMargin") as! CardMargin
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cardMargin
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return cardMargin
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "delete") { (action, view, completion) in
            //tableView.deleteRows(at: [indexPath], with: .automatic) - 삭제에 해당하는 네트워크 동작으로 업데이트
            completion(true)
        }
        
        let actionConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
        return actionConfiguration
    }
}


