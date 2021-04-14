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
        let response = try? JSONDecoder().decode(CellData.self, from: testDatas.CellData.dummyCellData)
        
        sut.getToDoData(needs: CellData.self, closure: { result in
            switch result {
            case .success(let data) :
                XCTAssertEqual(data.cardId, response?.cardId)
                XCTAssertEqual(data.content, response?.content)
                XCTAssertEqual(data.createdTime, response?.createdTime)
                XCTAssertEqual(data.isApp, response?.isApp)
                XCTAssertEqual(data.position, response?.position)
                XCTAssertEqual(data.title, response?.title)
            case .failure(_):
                XCTFail()
            }
        })
    }
    
    func test_getToDoDate_Failure() {
        sut = .init(session: MockURLSession(makeRequestFail: true))
        
        sut.getToDoData(needs: CellData.self, closure: { result in
            switch result {
            case .success :
                XCTFail()
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, NetworkService.NetworkError.nilData.localizedDescription)
            }
        })
    }
    
    func test_postToDoData() {
        let response = try? JSONDecoder().decode(CellData.self, from: testDatas.CellData.dummyCellData)
        
        sut.postToDoData(input: testDatas.CellData.dummyCellData, post: "", closure: { response in
            switch response {
            case .failure :
                XCTFail()
            case .success(let status) :
                XCTAssertEqual(status, 200)
            }
        })
    }
    
    func test_postToDoData_Failure() {
        sut = .init(session: MockURLSession(makeRequestFail: true))
        
        sut.postToDoData(input: testDatas.CellData.dummyCellData, post: "", closure: { response in
            switch response {
            case .failure(let error) :
                XCTAssertEqual(error.localizedDescription, NetworkService.NetworkError.badResponse.localizedDescription)
            case .success :
                XCTFail()
            }
        })
    }

}
