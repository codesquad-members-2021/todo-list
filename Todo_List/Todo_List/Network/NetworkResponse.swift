//
//  Response.swift
//  Todo_List
//
//  Created by 박혜원 on 2021/04/15.
//

import Foundation

struct CardRequest : Codable {
    let title : String
    let content : String
    let writer : String
    let taskType : String
}
//struct CardResponse : Codable {
//    let id : Int
//    let title : String
//    let content : String
//    let writer : String
//    let previousId : Int
//}
struct BoardResponse : Decodable {
    let todo : [Card]
    let doing : [Card]
    let done : [Card]
}


