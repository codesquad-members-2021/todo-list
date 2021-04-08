//
//  Endpoint.swift
//  ToDoListApp
//
//  Created by zombietux on 2021/04/08.
//

import Foundation
import Combine

struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem] = []
}

//1. URL 생성
extension Endpoint {

    var url: URL {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "localhost"
        components.port = 3000
        components.path = "\(path)"
        components.queryItems = queryItems

        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }

        return url
    }
}

extension Endpoint {
    //GET용
    static var cards: Self {
        return Endpoint(path: "/cards")
    }

    //POST용
    static func add(state: State) -> Self {
            return Endpoint(path: "/add",
                            queryItems: [
                                URLQueryItem(name: "\(state.rawValue)",
                                             value: "\(state.rawValue)_id")
                ]
            )
        }

    static func remove(state: State) -> Self {
            return Endpoint(path: "/remove",
                            queryItems: [
                                URLQueryItem(name: "\(state.rawValue)",
                                             value: "\(state.rawValue)_id")
                ]
            )
        }

    static func update(state: State) -> Self {
            return Endpoint(path: "/update",
                            queryItems: [
                                URLQueryItem(name: "\(state.rawValue)",
                                             value: "\(state.rawValue)_id")
                ]
            )
        }

    static func move(state: State) -> Self {
            return Endpoint(path: "/move",
                            queryItems: [
                                URLQueryItem(name: "\(state.rawValue)",
                                             value: "\(state.rawValue)_id")
                ]
            )
        }
}

enum State: String {
    case todo = "todo"
    case doing = "doing"
    case did = "did"

    var state: String {
        return rawValue
    }
}

