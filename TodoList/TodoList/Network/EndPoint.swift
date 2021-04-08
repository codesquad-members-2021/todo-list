//
//  EndPoint.swift
//  TodoList
//
//  Created by Ador on 2021/04/08.
//

import Foundation

enum EndPoint {
    private static let scheme = "https"
    private static let host = "team10-mockup.herokuapp.com"
    
    static func url(with path: Path) -> URL? {
        var components = URLComponents()
        components.scheme = EndPoint.scheme
        components.host = EndPoint.host
        components.path = path.rawValue
        return components.url
    }
}

enum Path: String {
    case lists = "/board/lists"
    case todo = "/board/todo"
    case doing = "/board/progress"
    case done = "/board/done"
}
