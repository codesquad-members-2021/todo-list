//
//  PositionManager.swift
//  ToDoListApp
//
//  Created by 이다훈 on 2021/04/08.
//

import Foundation

class PositionManager {
    
    let statingValue = 1024
    let gap = 125
    
    func getMaxPosition(in array : [CellData]) -> Int? {
        if array.isEmpty == true {
            return nil
        }
        guard var max = array.first?.position else { return nil }
        
        for cellData in array {
            max = cellData.position > max ? cellData.position : max
        }
        
        return max
    }
    
    func nextPosition(with array : [CellData]) -> Int {
        if array.isEmpty {
            return statingValue
        }
        
        guard let max = getMaxPosition(in: array) else {
            return statingValue
        }
        
        return max + gap
    }
    
    func relocate(array : [CellData]) -> [CellData] {
        let sorted = array.sorted(by: { lhs,rhs in
            lhs.position < rhs.position
        })
        
        var newPosition = statingValue
        for cellData in sorted {
            cellData.position = newPosition
            newPosition += gap
        }
        
        return sorted
    }
}
