//
//  TodoListTests.swift
//  TodoListTests
//
//  Created by Jun Ho JANG on 2021/04/06.
//

import XCTest

class TodoListTests: XCTestCase {
    
    override func setUp() {
    }
    
    override func tearDown() {
    }
    
    
    func test_APIRequestManager() {
        let toDoUrlString = Constants.url
        let logUrlString = Constants.url_log
        XCTAssertNotNil(APIRequestManager.requestGet(url: toDoUrlString, completionHandler: { (toDoList) in
     
        }))
        XCTAssertNotNil(APIRequestManager.requestGet_log(url: logUrlString, completionHandler: { (logModel) in
     
        }))
    }
    
    func text_post_request_does_not_fail() {
        let toDoUrlString = Constants.url
        let dataToSend = ["title": "test", "contents": "test", "status": "TODO"]
        APIRequestManager.requestPost(url: toDoUrlString, parameter: dataToSend, completionHandler: { (success, response) in
            XCTAssertTrue(success)
        })
    }
}
