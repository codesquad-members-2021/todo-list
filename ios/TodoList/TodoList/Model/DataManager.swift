//
//  DataRetriever.swift
//  TodoList
//
//  Created by Jun Ho JANG on 2021/04/06.
//

import Foundation



class DataManager {
    static private func requestGet(url: String, completionHandler: @escaping (Bool, ToDoList) -> Void) {
        guard let url = URL(string: url) else {
                print("Error: cannot create URL")
                return
            }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
                guard error == nil else {
                    print("Error: error calling GET")
                    print(error!)
                    return
                }
                guard let data = data else {
                    print("Error: Did not receive data")
                    return
                }
                guard let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode else {
                    print("Error: HTTP request failed")
                    return
                }
                guard let output = try? JSONDecoder().decode(ToDoList.self, from: data) else {
                    print("Error: JSON Data Parsing failed")
                    return
                }
                
                completionHandler(true, output)
            }.resume()
    }

    static private func requestPost(url: String, method: String, param: [String: Any], completionHandler: @escaping (Bool, Any) -> Void) {
        
        guard let url = URL(string: url) else {
            print("Error: cannot create URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: param)
        } catch {
            print(error.localizedDescription)
            completionHandler(false, error)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
        // create dataTask using the session object to send data to the server
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                print("Error: error calling GET")
                print(error!)
                return
            }
            guard let data = data else {
                print("Error: Did not receive data")
                return
            }
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
            }
            
            completionHandler(true, responseJSON)
        }.resume()
    }

    static public func request(url: String, method: String, param: [String: Any]? = nil, completionHandler: @escaping (Bool, Any) -> Void) {
        if method == "GET" {
            requestGet(url: url) { (success, data) in
                completionHandler(success, data)
            }
        } else {
            requestPost(url: url, method: method, param: param!) { (success, data) in
                completionHandler(success, data)
            }
        }
    }
}
