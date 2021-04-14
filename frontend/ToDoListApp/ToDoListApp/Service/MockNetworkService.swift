//
//  MockNetworkService.swift
//  ToDoListApp
//
//  Created by 이다훈 on 2021/04/06.
//

import Foundation

protocol URLSessionProtocol {
    func dataTask(with request: URLRequest, completionHandler : @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession : URLSessionProtocol {}

class MockURLSessionDataTask: URLSessionDataTask {
    override init() {}
    var resumeDidCall: () -> Void = {}
    
    override func resume() {
        resumeDidCall()
    }
}

class MockURLSession: URLSessionProtocol {
    
    private var makeRequestFail = false
    
    init(makeRequestFail : Bool = false) {
        self.makeRequestFail = makeRequestFail
    }
    
    private var sessionDataTask: MockURLSessionDataTask?
    
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        
        let successResponse = HTTPURLResponse(url: URL.init(string: "")!,
                                              statusCode: 200,
                                              httpVersion: "2",
                                              headerFields: nil)
        
        let failureResponse = HTTPURLResponse(url: URL.init(string: "")!,
                                              statusCode: 410,
                                              httpVersion: "2",
                                              headerFields: nil)
        
        let sessionDataTask = MockURLSessionDataTask()
        
        
        
        sessionDataTask.resumeDidCall = {
            if self.makeRequestFail {
                completionHandler(nil,failureResponse,nil)
            } else {
                completionHandler(testDatas.CellData.dummyCellData,successResponse,nil)
            }
        }
        self.sessionDataTask = sessionDataTask
        return sessionDataTask
    }
}

enum testDatas {
    case CellData
    var dummyCellData : Data {
        Data (
            """
            {
                "cardId": 0,
                "title" : "dummyTitle",
                "content" : "dummyTitle",
                "isApp": true,
                "createdTime" : "2021-04-06 23:12:12",
                "position" : 1024
            }
            """.utf8
        
        )
    }
}

class testCellData : Codable {
    var title : String
    var body : String
    var isApp : Bool
    var date : String
}
