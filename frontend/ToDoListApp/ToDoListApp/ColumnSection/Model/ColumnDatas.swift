//
//  ColumnDatas.swift
//  ToDoListApp
//
//  Created by 박정하 on 2021/04/07.
//

import Foundation

class ColumnDatas : DataManager{
    private var cellDatas :[CellData]
    
    init() {
        cellDatas = []
    }
    
    func add(cellData : CellData) -> Void{
        cellDatas.append(cellData)
    }
    
    func currentDatasCount() -> Int{
        return cellDatas.count
    }
}
