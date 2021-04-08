//
//  DoingDataSource.swift
//  TodoList
//
//  Created by HOONHA CHOI on 2021/04/07.
//

import Foundation
import UIKit

class DoingDataSource : NSObject {
    let author = "author by IOS"
    var tasks: [Task] = []
}

extension DoingDataSource : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int {
        return 1
    }
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? DoingTableViewCell else {
            return UITableViewCell()
        }
        
        cell.title.text = tasks[indexPath.section].title
        cell.content.text = tasks[indexPath.section].contents
        cell.author.text = author
   
        return cell
    }
    
}
