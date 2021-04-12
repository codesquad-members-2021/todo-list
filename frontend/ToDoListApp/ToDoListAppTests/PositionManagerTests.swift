//
//  PositionManagerTests.swift
//  ToDoListAppTests
//
//  Created by 이다훈 on 2021/04/12.
//

import XCTest
@testable import ToDoListApp

class PositionManagerTests: XCTestCase {
    var positionManager : PositionManager!
    var nilCellDataArray : [CellData]!
    var cellDataArray : [CellData]!
    
    override func setUpWithError() throws {
        positionManager = .init()
        nilCellDataArray = .init()
        cellDataArray = .init(arrayLiteral: CellData(cardId: 0, title: "title0", content: "content0", isApp: true, createdTime: "2021-04-12 15:52:??", position: 0))
    }
    
    func test_getMaxPosition_nil() {
        let max = positionManager.getMaxPosition(in: nilCellDataArray)
        XCTAssertEqual(max, nil)
    }
    
    func test_getMaxPosition() {
        let max = positionManager.getMaxPosition(in: cellDataArray)
        XCTAssertEqual(max, 0)
    }
    
    func test_nextPosition_Empty_Array() {
        let next = positionManager.nextPosition(with: nilCellDataArray)
        XCTAssertEqual(next, 1024)
    }
    
    func test_nextPosition() {
        let next = positionManager.nextPosition(with: cellDataArray)
        XCTAssertEqual(next, 125)
    }
    
    func test_relocate() {
        let relocated = positionManager.relocate(array: cellDataArray)
        
        let comparisonTarget : [CellData] = .init(arrayLiteral: CellData(cardId: 0, title: "title0", content: "content0", isApp: true, createdTime: "2021-04-12 15:52:??", position: 1024))
        XCTAssertEqual(relocated[0].position, comparisonTarget[0].position)
    }
}
