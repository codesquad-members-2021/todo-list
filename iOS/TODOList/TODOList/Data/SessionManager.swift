//
//  SessionManager.swift
//  TODOList
//
//  Created by 양준혁 on 2021/04/07.
//

import Foundation

class SessionManger {
    static func request(urlRequest: URLRequest, completion: @escaping (Data)-> Void) {
        URLSession.shared.dataTask(with: urlRequest) { (data, _, _) in
            guard let data = data else { return }
            completion(data)
        }.resume()
    }
}
