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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        willDoTableView.dataSource = dataSource
        willDoTableView.delegate = self
        let nibName = UINib(nibName: "ToDoTableViewCell", bundle: .none)
        willDoTableView.register(nibName, forCellReuseIdentifier: "tableCell")
        
        setBadgeViewRadius()
        updateTableView()
        loadData()
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
    
}


