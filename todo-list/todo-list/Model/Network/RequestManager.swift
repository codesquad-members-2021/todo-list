//
//  RequestManager.swift
//  todo-list
//
//  Created by sonjuhyeong on 2021/04/09.
//

import Foundation

class RequestManager {
        
    //GET
    static func get(url: String) -> URLRequest {
        guard let url = URL(string: url) else {
            print("The URL is inappropriate.")
            return URLRequest(url: URL(string: "")!)
        }
        return URLRequest(url: url)
    }
        
    //POST
    static func post(url: String, data: Data) -> URLRequest {
        guard let url = URL(string: url) else {
            print("The URL is inappropriate.")
            return URLRequest(url: URL(string: "")!)
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    //delete
    static func delete(url: String) -> URLRequest {
        guard let url = URL(string: url) else {
            print("The URL is inappropriate.")
            return URLRequest(url: URL(string: "")!)
        }
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        return request
    }
    
}

class NetworkManager {
    
    static func getData(urlString: String, completion: @escaping (String) -> ()) {
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    guard let result = ParsingManager.decodeData(type: TodoInfoList.self, data: data) else {
                        return
                    }
                    print(result)
                    completion(result.getTodoListString())
                }
            }.resume()
        }
    }
}
