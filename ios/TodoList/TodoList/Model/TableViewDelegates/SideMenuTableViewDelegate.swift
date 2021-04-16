//
//  SideMenuTableViewDelegate.swift
//  TodoList
//
//  Created by Jun Ho JANG on 2021/04/15.
//

import UIKit

class SideMenuTableViewDelegate: NSObject {
    
    private var list: [String] = []
    
}

extension SideMenuTableViewDelegate: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCell", for: indexPath) as! SideMenuTableViewCell
        let cards = self.list
        cell.emojiLabel.text = "A"
        cell.userLabel.text = "B"
        cell.contentLabel.text = "C"
        cell.didTimeLabel.text = "D"
        return cell
    }
}

