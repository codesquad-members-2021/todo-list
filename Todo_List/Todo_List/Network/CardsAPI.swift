//
//  CardAPI.swift
//  Todo_List
//
//  Created by 박혜원 on 2021/04/12.
//

import Foundation

enum CardAPI : CodingKey{
    case all
    case todo
    case doing
    case done
    
    static let baseURL = "http://3.36.140.12:8080/tasks/"
    var path : String { "" }
    var url : URL { URL(string: CardAPI.baseURL + path)! }
}

enum APIError: LocalizedError {
    case unknownError
    var errorDescription: String? { "unknown Error"}
}

struct CardResponse: Decodable {
    let value : Card
}
struct CardsResponse : Decodable {
    let value : [Card]
}
