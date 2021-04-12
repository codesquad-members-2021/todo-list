//
//  Card.swift
//  TODOList
//
//  Created by Issac on 2021/04/11.
//

import Foundation

struct Card: Codable {
    var id: Int
    var title: String
    var contents: String
    var columnId: Int
    var createdDateTime: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case contents
        case columnId = "column_id"
        case createdDateTime = "created_date_time"
    }
}
