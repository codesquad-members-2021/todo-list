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
    
    func test_JSONParser() {
        let urlString = "https://jsonplaceholder.typicode.com/todos"
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    XCTAssertNotNil(JSONParser.parseData(data: data))
                }
            }.resume()
        }
    }
    
    func test_DataManager() {
        let urlString = "https://jsonplaceholder.typicode.com/todos"
        XCTAssertNotNil(DataManager.getData(urlString: urlString, completion: { (data) in
            
        }))
    }

}
