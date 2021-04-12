//
//  TODOTableViewDataSource.swift
//  TODOList
//
//  Created by Issac on 2021/04/06.
//

import UIKit

class SectionViewDataSource: NSObject {
    weak var dataSource: DataPassable?
    
    var deleteCard: ((Status) -> ())?
}

extension SectionViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let status = self.dataSource?.passData() else { return 0 }
        return status.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SectionCell.identifier, for: indexPath) as? SectionCell else { return SectionCell() }
        guard let status = self.dataSource?.passData() else { return SectionCell() }
        cell.subject.text = status[indexPath.row].title
        cell.body.text = status[indexPath.row].contents
        cell.body.sizeToFit()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("delete")
            guard let status = self.dataSource?.passData() else { return }
            deleteCard?(status[indexPath.row])
        }
    }
}
