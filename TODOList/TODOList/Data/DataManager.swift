//
//  SessionManager.swift
//  TODOList
//
//  Created by 양준혁 on 2021/04/07.
//

import Foundation

class DataManager {
    static func decoding<T: Decodable>(decodable: T.Type, data: Data) -> T? {
        return try? JSONDecoder().decode(decodable, from: data)
    }
    
    static func encoding<T: Encodable>(encodable: T) -> Data? {
        return try? JSONEncoder().encode(encodable)
    }
}
