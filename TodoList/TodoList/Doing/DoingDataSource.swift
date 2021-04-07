//
//  DoingDataSource.swift
//  TodoList
//
//  Created by HOONHA CHOI on 2021/04/07.
//

import Foundation
import UIKit

class DoingDataSource : NSObject {

    let todoTitle = ["Git공부하기", "IOS 공부하기", "HTML/CSS 공부하기"]
    let content = ["add, delete", "UILabel, UIButton", "p tag, body tag"]
    let author = "author by IOS"
    
}

extension DoingDataSource : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int {
        return 1
    }
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? DoingTableViewCell else {
            return UITableViewCell()
        }
        
        cell.title.text = todoTitle[indexPath.section]
        cell.content.text = content[indexPath.section]
        cell.author.text = author
   
        return cell
    }
    
}
