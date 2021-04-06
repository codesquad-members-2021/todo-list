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
    
    func test_getToDoData() {
        let response = try? JSONDecoder().decode(testCellData.self, from: testDatas.CellData.dummyCellData)
        
        sut.getToDoData(needs: testCellData.self, closure: { result in
            switch result {
            case .success(let data) :
                XCTAssertEqual(data.title, response?.title)
                XCTAssertEqual(data.body, response?.body)
                XCTAssertEqual(data.isApp, response?.isApp)
                XCTAssertEqual(data.date, response?.date)
            case .failure(_):
                XCTFail()
            }
        })
    }
    
    func test_getToDoDate_Failure() {
        sut = .init(session: MockURLSession(makeRequestFail: true))
        
        sut.getToDoData(needs: testCellData.self, closure: { result in
            switch result {
            case .success :
                XCTFail()
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, NetworkService.NetworkError.nilData.localizedDescription)
            }
        })
    }
    

}
