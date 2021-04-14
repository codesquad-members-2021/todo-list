//
//  DoDataSource.swift
//  TodoList
//
//  Created by Ador on 2021/04/08.
//

import UIKit

class DoDataSource : NSObject { }

extension DoDataSource : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int {
        return 1
    }
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return DoDTO.shared.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DoCell", for: indexPath) as? TaskTableViewCell else {
            return UITableViewCell()
        }
        
        let task = DoDTO.shared.configure(index: indexPath.section)
        cell.configure(task: task)

        return cell
    }
}
