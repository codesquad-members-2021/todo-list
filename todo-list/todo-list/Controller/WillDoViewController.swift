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
    private var data = [["title","1줄짜리입력"],
                        ["title","2줄짜리입력\n2줄짜리입력"],
                        ["title","3줄짜리입력\n3줄짜리입력\n3줄짜리입력"],
                        ["title","4줄짜리입력\n4줄짜리입력\n4줄짜리입력\n4줄짜리입력"]]
    
    @IBOutlet weak var willDoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        willDoTableView.dataSource = self
        willDoTableView.delegate = self
        let nibName = UINib(nibName: "ToDoTableViewCell", bundle: .none)
        willDoTableView.register(nibName, forCellReuseIdentifier: "tableCell")
        
        setBadgeViewRadius()
        updateTableView()
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
}

extension WillDoViewController: UITableViewDelegate {
    
}

extension WillDoViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! ToDoTableViewCell
        let index = indexPath.row % 4
        cell.titleLabel.text = data[index][0]
        cell.contentLabel.text = data[index][1]
        return cell
    }
}

