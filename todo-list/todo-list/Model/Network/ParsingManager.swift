//
//  ParsingManager.swift
//  todo-list
//
//  Created by sonjuhyeong on 2021/04/09.
//

import Foundation

class ParsingManager {
    
    static func encodeData<T: Codable>(data: T) -> Data? {
        let encoder = JSONEncoder()
        do {
            return try encoder.encode(data)
        }catch{
            print("Encode error")
            return nil
        }
    }
    
    static func decodeData<T: Codable>(type: T.Type, data: Data) -> T? {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(type, from: data)
        }catch{
            print("Decode error")
            return nil
        }
    }
}
