//
//  CardAPI.swift
//  Todo_List
//
//  Created by 박혜원 on 2021/04/12.
//

import Foundation

enum CardAPI : String, CodingKey{
    case all = ""
    case todo
    case doing
    case done
    
    static let baseURL = "http://3.36.140.12:8080/tasks/"
    var path : String { self.stringValue }
    var url : URL { URL(string: CardAPI.baseURL + path)! }
}
