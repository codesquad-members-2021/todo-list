//
//  DoneDataSource.swift
//  TodoList
//
//  Created by Ador on 2021/04/11.
//

import UIKit

class DoneDataSource : NSObject { }

extension DoneDataSource : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int {
        return 1
    }
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return DoneDTO.shared.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DoCell", for: indexPath) as? TaskTableViewCell else {
            return UITableViewCell()
        }
        
        let task = DoneDTO.shared.configure(index: indexPath.section)
        cell.configure(task: task)

        return cell
    }
}
