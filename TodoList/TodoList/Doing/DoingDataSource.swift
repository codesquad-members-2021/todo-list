//
//  DoingDataSource.swift
//  TodoList
//
//  Created by HOONHA CHOI on 2021/04/07.
//

import Foundation
import UIKit

class DoingDataSource : NSObject { }

extension DoingDataSource : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int {
        return 1
    }
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return DoingDTO.shared.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DoCell", for: indexPath) as? TaskTableViewCell else {
            return UITableViewCell()
        }
        
        let task = DoingDTO.shared.configure(index: indexPath.section)
        cell.configure(task: task)
        return cell
    }
    
}
