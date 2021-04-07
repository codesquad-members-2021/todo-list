//
//  Networking.swift
//  TODOList
//
//  Created by 양준혁 on 2021/04/07.
//

import Foundation

class Networking {
    let session: URLSession
    let baseURL: String
    
    init(baseURL: String) {
        session = .shared
        self.baseURL = baseURL
    }
    
    func getToDoList(completionHandler: @escaping (Data)->Void) {
        guard let url = URL(string: baseURL) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        SessionManger.request(urlRequest: request) { (data) in
            let decodedData = DataManager.decoding(decodable: <#T##Decodable.Protocol#>, data: data)
            completionHandler(decodedData)
        }
    }
    
    func postToDoList(comletionHandler: @escaping (Data)->Void) {
        guard let url = URL(string: baseURL) else { return }
        var request = URLRequest(url: url)
        let encodedData = DataManager.encoding(encodable: <#T##Encodable#>)
        request.httpMethod = "POST"
        request.httpBody = encodedData
        SessionManger.request(urlRequest: request) { (data) in
            let decodedData = DataManager.decoding(decodable: <#T##Decodable.Protocol#>, data: data)
            completionHandler(decodedData)
        }
    }
}
