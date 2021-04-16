//
//  Coder.swift
//  Todo_List
//
//  Created by Lia on 2021/04/16.
//

import Foundation

class DecodeManager {
    
    static func decode<T:Decodable>(json: Data, dataType: T.Type, completion: @escaping (Result<Any,NetworkError>) -> Void) {
        let decoder = JSONDecoder()
        guard let data = try? decoder.decode(dataType, from: json) else {
            completion(.failure(.DecodeError))
            return
        }
        completion(.success(data))
    }
}

class EncodeManager {
    
    static func encode<T:Encodable>(anyData: T, completion: @escaping (Result<Any,NetworkError>) -> Void) {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        guard let data = try? encoder.encode(anyData) else {
            completion(.failure(.EncodeError))
            return
        }
        completion(.success(data))
    }
}
