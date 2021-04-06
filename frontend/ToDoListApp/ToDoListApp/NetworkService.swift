//
//  NetworkService.swift
//  ToDoListApp
//
//  Created by 이다훈 on 2021/04/06.
//

import Foundation

class NetworkService {
    
    enum NetworkError : Error {
        case invalidData
        case nilData
    }
    
    private let urlString = String()
    
    private func decode<T:Codable> (form : T, data: Data?) -> Result<T,NetworkError> {
        guard let data = data else {
            return .failure(.nilData)
        }
        
        let decoder = try? JSONDecoder().decode(T.self, from: data)
        guard let returnData = decoder else {
            return .failure(.invalidData)
        }
        return .success(returnData)
    }
    
    func getToDoData<T:Codable> (needs dataSet : T,closure : @escaping (Result<T,NetworkError>) -> Void) {
        guard let url = URL.init(string: self.urlString) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request, completionHandler: {(data,response,error) in
            
            let result = self.decode(form : dataSet, data: data)
            
            closure(result)
        }).resume()
    }
    
    func postToDoData<T:Codable> (input : T, post type : String, closure : @escaping (Result<T,NetworkError>) -> Void) {
        
        let optionalURL = URL.init(string: urlString + type)
        guard let url = optionalURL else {
            return
        }
        
        let sendData = try? JSONEncoder().encode(input)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = sendData
        
        URLSession.shared.dataTask(with: request, completionHandler: {(data,response,error) in
            
            let result = self.decode(form : input, data: data)
            
            closure(result)
        }).resume()
    }
}

class testCellData : Codable {
    var title : String
    var body : String
    var isApp : Bool
    var date : Date
}

class testHistory : Codable {
    var author : String = ""
    var date : Date
    var title : String = ""
    var action : String//historyAction
    var from : String?
    var to : String?
    
//    enum historyAction : String {
//        case add = "add"
//        case remove = "remove"
//        case update = "update"
//        case move = "move"
//    }
}
