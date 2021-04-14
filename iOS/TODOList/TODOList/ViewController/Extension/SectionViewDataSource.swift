//
//  TODOTableViewDataSource.swift
//  TODOList
//
//  Created by Issac on 2021/04/06.
//

import UIKit

class SectionViewDataSource: NSObject {
    weak var dataSource: DataPassable?
    
    var deleteCard: ((Card) -> ())?
}

extension SectionViewDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let cards = self.dataSource?.passData() else { return 0 }
        return cards.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SectionCell.identifier, for: indexPath) as? SectionCell else { return SectionCell() }
        guard let cards = self.dataSource?.passData() else { return SectionCell() }
        cell.subject.text = cards[indexPath.section].title
        cell.body.text = cards[indexPath.section].contents + "안녕하세요 반갑습니다 잘 부탁드립니다안녕하세요 반갑습니다 잘 부탁드립니다안녕하세요 반갑습니다 잘 부탁드립니다"
        cell.backgroundColor = .white
        cell.body.sizeToFit()

        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let cards = self.dataSource?.passData() else { return }
            deleteCard?(cards[indexPath.row])
        }
    }
}
