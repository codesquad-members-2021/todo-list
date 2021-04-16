//
//  DataRetriever.swift
//  TodoList
//
//  Created by Jun Ho JANG on 2021/04/06.
//

import Foundation

class APIRequestManager {
    static func requestGet_log(url: String, completionHandler: @escaping (LogModel) -> Void) {
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
            print(String(data: data, encoding: .utf8))
                
                guard let output = try? JSONDecoder().decode(LogModel.self, from: data) else {
                    print("Error: JSON Data Parsing failed")
                    return
                }
                completionHandler(output)
            }.resume()
    }
    
    static func requestGet(url: String, completionHandler: @escaping (ToDoList) -> Void) {
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
                completionHandler(output)
            }.resume()
    }

    static func requestPost(url: String, parameter: [String: Any], completionHandler: @escaping (Bool, Any) -> Void) {
        guard let url = URL(string: url) else {
                print("Error: cannot create URL")
                return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameter)
        } catch {
            print(error.localizedDescription)
            completionHandler(false, error)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
        // create dataTask using the session object to send data to the server
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                print("Error: error calling POST")
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
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                completionHandler(true, responseJSON)
            }
        }.resume()
    }

    static func requestDelete(url: String, id: Int, completionHandler: @escaping (Any) -> Void) {
        guard var url = URL(string: url) else {
            print("Error: cannot create URL")
            return
        }
    
        url.appendPathComponent(String(id))
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
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
            
            guard let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode else {
                print("Error: HTTP request failed")
                return
            }
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                completionHandler(responseJSON)
            }
        }.resume()
        
    }
}
