//
//  URLSessionManager.swift
//  TodoList
//
//  Created by Ador on 2021/04/08.
//

import Foundation

class URLSessionManager {
    
    static func request(with url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        URLSession.shared.dataTask(with: url, completionHandler: { data, res, error in
            guard let data = data, error == nil else {
                return
            }
            guard let response = res as? HTTPURLResponse,
                  response.statusCode == 200 else {
                return
            }
            completion(.success(data))
        }).resume()
    }
}
