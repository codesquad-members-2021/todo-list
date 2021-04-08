//
//  TODOTableViewDataSource.swift
//  TODOList
//
//  Created by Issac on 2021/04/06.
//

import UIKit
import Combine

class TODOTableViewDataSource: NSObject {
    
    weak var dataSource: PassableData?
}


extension TODOTableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = self.dataSource?.passData() else { return 0 }
        return data.subject.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SectionCell.identifier, for: indexPath) as? SectionCell else { return SectionCell() }
        guard let data = self.dataSource?.passData() else { return SectionCell() }
        cell.subject.text = data.subject[indexPath.row]
        return cell
    }
}
