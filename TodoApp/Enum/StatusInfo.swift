
//  Created by 김지선 on 2021/04/08.


import Foundation

enum StatusInfo {
    static let toDo = "Todo"
    static let inProgress = "Inprogress"
    static let done = "Done"
}

enum ColumnInfo {
    static let first = 0
    static let second = 1
    static let third = 2
}

enum TitleList {
    static let ofStatus = [ColumnInfo.first: StatusInfo.toDo, ColumnInfo.second: StatusInfo.inProgress, ColumnInfo.third: StatusInfo.done]
}
