//
//  Decoder.swift
//  TodoList
//
//  Created by Ador on 2021/04/08.
//

import Foundation

class Decoder {
    static func decode(from json: Data) -> [Task]? {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-DD'T'HH:mm:ss.SSS"
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(formatter)
        return try? decoder.decode([Task].self, from: json)
    }
}
