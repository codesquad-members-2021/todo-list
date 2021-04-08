//
//  NetworkManager.swift
//  ToDoListApp
//
//  Created by zombietux on 2021/04/08.
//

import Foundation
import Combine

protocol HttpMethodProtocol: class {

    func get<T>(type: [T].Type,
                url: URL
    ) -> AnyPublisher<[T], Error> where T: Decodable
}

final class NetworkManager: HttpMethodProtocol {
    
    func get<T>(type: T.Type,
                url: URL
    ) -> AnyPublisher<T, Error> where T : Decodable {
        
        let urlRequest = URLRequest(url: url)
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

