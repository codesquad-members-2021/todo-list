//
//  DataManager.swift
//  ToDoListApp
//
//  Created by 박정하 on 2021/04/07.
//

import Foundation

protocol DataManager {
    func currentDatasCount() -> Int
    func add(cellData : CellData) -> Void
    func cellDataTitle(index : Int) -> String
    func cellDataContent(index : Int) -> String
}
