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
    
    func post<T>(title: String, contents: String, url: URL) -> AnyPublisher<T, Error> where T: Decodable
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
    
    func post<T>(title: String, contents: String, url: URL) -> AnyPublisher<T, Error> where T: Decodable {
        let url = URL(string: "http://localhost:3000/cards/2")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let body = try? JSONEncoder().encode(Card(title: title, contents: contents))
        request.httpBody = body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
