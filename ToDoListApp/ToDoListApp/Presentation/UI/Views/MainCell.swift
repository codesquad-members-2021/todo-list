//
//  MainCell.swift
//  ToDoListApp
//
//  Created by zombietux on 2021/04/07.
//

import UIKit

class MainCell: UICollectionViewCell {
    static let identifier = "MainCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    private var board: BoardManageable?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.dataSource = self
    }
    
    func setup(with board: BoardManageable) {
        self.board = board
        tableView.reloadData()
    }
}

extension MainCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return board?.count() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CardCell.identifier, for: indexPath) as? CardCell else { return UITableViewCell() }
        
        cell.title = board?.getBoard().getCards()[indexPath.row].getTitle()
        cell.contents = board?.getBoard().getCards()[indexPath.row].getContents()
        
        return cell
    }
}
