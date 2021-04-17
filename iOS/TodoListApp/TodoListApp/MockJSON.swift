//
//  MockJSON.swift
//  TodoListApp
//
//  Created by Song on 2021/04/12.
//

import Foundation

struct MockJSON {
    static let json = """
    [
        {
            "id": 1,
            "title": "Test Card 1",
            "contents": "This is a test card",
            "createDate": "2021-04-10 12:00:00",
            "todo": true,
            "doing": false,
            "done": false
        },
        {
            "id": 2,
            "title": "Test Card 2",
            "contents": "This is a test card",
            "createDate": "2021-04-11 12:00:00",
            "todo": false,
            "doing": true,
            "done": false
        },
        {
            "id": 3,
            "title": "Test Card 3",
            "contents": "This is a test card",
            "createDate": "2021-04-12 12:00:00",
            "todo": true,
            "doing": false,
            "done": false
        }
    ]
    """.data(using: .utf8)!
}
