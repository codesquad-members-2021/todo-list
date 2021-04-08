//
//  DoDataSource.swift
//  TodoList
//
//  Created by Ador on 2021/04/08.
//

import UIKit

class DoDataSource : NSObject {
    let author = "author by IOS"
    var tasks: [Task] = []
}

extension DoDataSource : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int {
        return 1
    }
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DoCell", for: indexPath) as? DoTableViewCell else {
            return UITableViewCell()
        }
        
        cell.title.text = tasks[indexPath.section].title
        cell.content.text = tasks[indexPath.section].contents
        cell.author.text = author
   
        return cell
    }
}
