//
//  NetworkServiceTests.swift
//  ToDoListAppTests
//
//  Created by 이다훈 on 2021/04/06.
//

import XCTest
@testable import ToDoListApp

class NetworkServiceTests: XCTestCase {
    
    var sut : NetworkService!
    
    override func setUpWithError() throws {
        sut = .init(session: MockURLSession())
    }
    
    func test_getToDoData {
        let expectation = XCTestExpectation()
        let response = try? JSONDecoder().decode(testCellData.self, from: testDatas)
    }
    

}
