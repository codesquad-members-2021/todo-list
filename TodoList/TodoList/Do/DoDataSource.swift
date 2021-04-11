//
//  DoDataSource.swift
//  TodoList
//
//  Created by Ador on 2021/04/08.
//

import UIKit

class DoDataSource : NSObject {
    private(set) var doDTO = DoDTO()
}

extension DoDataSource : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int {
        return 1
    }
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return doDTO.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DoCell", for: indexPath) as? DoTableViewCell else {
            return UITableViewCell()
        }
        
        let task = doDTO.configure(index: indexPath.section)
        cell.configure(task: task)

        return cell
    }
}
