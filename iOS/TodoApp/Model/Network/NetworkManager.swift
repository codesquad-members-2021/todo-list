//
//  NetworkManager.swift
//  TodoApp
//
//  Created by 김지선 on 2021/04/12.
//

import Foundation

class NetworkManager {
    
    static func loginPost() {
        let data = ["userId" : "user1", "password" : "1234"]
        let body = try? JSONEncoder().encode(data)
        
        let url = URL(string: "http://3.36.217.168:8080/login")
        
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = body
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print(error)
                return
            }
            
            DispatchQueue.main.async {
                do {
                    let object = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                    guard let jsonObject = object else { return }
                    print(jsonObject)
                    self.fetchData()
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }

    static func fetchData() {
        DispatchQueue.main.async {
            do {
                let url = URL(string: "http://3.36.217.168:8080/works")
                let data = try Data(contentsOf: url!)
                let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [Any]
                json?.forEach({ parse in
                    let task = parse as! [String: Any]
                    let _ = task["id"] as! Int
                    let status = task["status"] as! Int - 1
                    let title = task["title"] as! String
                    let content = task["description"] as! String
                    
                    let taskCard = TaskCard(status: status, title: title, content: content)
                    NotificationCenter.default.post(name: .setupTask, object: self, userInfo: ["taskCard": taskCard])
                })
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
    
    static func updateData() {
        NotificationCenter.default.addObserver(self, selector: #selector(sendRemovedData(_:)), name: .removeTask, object: nil)
    }
    
    @objc func sendRemovedData(_ notification: Notification) {
        let removedData = notification.userInfo?["removedData"] as! TaskCard
        NetworkManager.dataPost(httpMethod: HTTPMethod.delete, data: removedData)
    }
    
    static func dataPost(httpMethod: String, data: TaskCard) {
        let url = URL(string: "http://3.36.217.168:8080/works/{id}")
        let body = try? JSONEncoder().encode(data)
        var request = URLRequest(url: url!)
        request.httpMethod = httpMethod
        request.httpBody = body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            print(response)
            if let error = error {
                print(error)
                return
            }
        }
        task.resume()
    }
}

