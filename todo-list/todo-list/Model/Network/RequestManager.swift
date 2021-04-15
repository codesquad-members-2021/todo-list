//
//  RequestManager.swift
//  todo-list
//
//  Created by sonjuhyeong on 2021/04/09.
//

import Foundation

class RequestManager {
    static let urlString = "http://ec2-13-124-220-184.ap-northeast-2.compute.amazonaws.com:8080/categories"
    //GET
    static func getRequest() -> URLRequest {
        guard let url = URL(string: urlString) else {
            print("The URL is inappropriate.")
            return URLRequest(url: URL(string: "")!)
        }
        return URLRequest(url: url)
    }
        
    //POST
    static func postRequest(category: Int, data: Data) -> URLRequest {
        guard let url = URL(string: "\(urlString)/\(category)/cards") else {
            print("The URL is inappropriate.")
            return URLRequest(url: URL(string: "")!)
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    //PUT
    static func contextMenuPutRequest(category: Int, cardID: Int, data: Data) -> URLRequest {
        guard let url = URL(string: "\(urlString)/\(category)/cards/\(cardID)") else {
            print("The URL is inappropriate.")
            return URLRequest(url: URL(string: "")!)
        }
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    static func dragAndDropPutRequest(startCartegoryID: Int, startCardIndex: Int, endCartegoryID: Int, endCardIndex: Int) -> URLRequest {
        guard let url = URL(string: "\(urlString)/\(startCartegoryID)/cards/\(startCardIndex)/move/\(endCartegoryID)/\(endCardIndex)") else {
            print("The URL is inappropriate.")
            return URLRequest(url: URL(string: "")!)
        }
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }

    
    
    //delete
    static func deleteRequest(category: Int, cardID: Int) -> URLRequest {
        guard let url = URL(string: "\(urlString)/\(category)/cards/\(cardID)") else {
            print("The URL is inappropriate.")
            return URLRequest(url: URL(string: "")!)
        }
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        return request
    }
    
}
