//
//  ColumnDataSource.swift
//  ToDoListApp
//
//  Created by 박정하 on 2021/04/07.
//

import UIKit

class ColumnDataSource : NSObject, UITableViewDataSource {
    private let datas : DataManager
    
    init(datamanager : DataManager) {
        self.datas = datamanager
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell : ColumnCell = tableView.dequeueReusableCell(withIdentifier: "ColumnCell", for: indexPath) as? ColumnCell else {return UITableViewCell()}
        
        return cell
    }
}
