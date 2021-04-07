//
//  TODOTableViewDataSource.swift
//  TODOList
//
//  Created by Issac on 2021/04/06.
//

import UIKit

class TODOTableViewDataSource: NSObject {
    var subject: [String]
    var body: [String]
    var handler: (State) -> ()
    
    override init() {
        self.subject = [String]()
        self.body = [String]()
        self.handler = { _ in }
        super.init()
        self.handler = { state in
            self.subject = state.subject
            self.body = state.body
        }
    }
}


extension TODOTableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subject.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SectionCell.identifier, for: indexPath) as? SectionCell else { return UITableViewCell() }
        cell.subject.text = subject[indexPath.row]
        return cell
    }
}
