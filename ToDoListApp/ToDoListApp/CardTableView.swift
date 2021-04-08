//
//  CardTableView.swift
//  ToDoListApp
//
//  Created by user on 2021/04/08.
//

import UIKit

class CardTableView: UITableView {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureCell()
//        self.tableHeaderView = headerView
    }
    
    func configureCell() {
        let nibName = UINib(nibName: "CardCell", bundle: nil)
        self.register(nibName, forCellReuseIdentifier: "cardCell")
        self.rowHeight = UITableView.automaticDimension
        self.estimatedRowHeight = 108
        self.separatorStyle = .none
    }
}
