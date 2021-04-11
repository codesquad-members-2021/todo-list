//
//  DoneDataSource.swift
//  TodoList
//
//  Created by Ador on 2021/04/11.
//

import UIKit

class DoneDataSource : NSObject {
    private(set) var doneDTO = DoneDTO()
}

extension DoneDataSource : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int {
        return 1
    }
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return doneDTO.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DoneCell", for: indexPath) as? DoneTableViewCell else {
            return UITableViewCell()
        }
        
        let task = doneDTO.configure(index: indexPath.section)
        cell.configure(task: task)

        return cell
    }
}
