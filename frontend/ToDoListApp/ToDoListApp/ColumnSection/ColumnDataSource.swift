//
//  ColumnDataSource.swift
//  ToDoListApp
//
//  Created by 박정하 on 2021/04/07.
//

import UIKit

class ColumnDataSource : NSObject, UITableViewDataSource {
    private let columnIdentifier : String
    private let datas : DataManager
    
    init(columnidentifier : String, datamanager : DataManager) {
        self.columnIdentifier = columnidentifier
        self.datas = datamanager
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 //temp
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell : ColumnCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.column1.rawValue) as? ColumnCell else {return UITableViewCell()}
        return cell
    }
}
