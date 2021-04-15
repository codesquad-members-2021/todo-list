//  Created by 김지선 on 2021/04/12.
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
        let url = URL(string: "http://3.36.217.168:8080/works")
        var request = URLRequest(url: url!)
        request.httpMethod = HTTPMethod.get
                
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            DispatchQueue.main.async() {
                do {
                    let object = try JSONSerialization.jsonObject(with: data!, options: []) as? NSArray
                    guard let jsonObject = object else { return }
                    jsonObject.forEach { parse in
                        let task = parse as! [String:Any]
                        let id = task["id"] as! Int
                        let title = task["title"] as! String
                        let content = task["content"] as! String
                        let createdAt = task["createdAt"] as! String
                        let status = task["status"] as! Int - 1
                        let author = task["author"] as! String
                        let taskCard = TaskCard(id: id, title: title, content: content, createdAt: createdAt, status: status, author: author)
                        NotificationCenter.default.post(name: .requestSetupTask, object: self, userInfo: ["taskCard": taskCard])
                    }
                } catch let error as NSError {
                    print(error)
                }
            }
        }
        task.resume()
        }

    static func changedDataPost(httpMethod: String, data: TaskCard) {
        let id = data.id
        var syncData = data
        syncData.status += 1
        let url = URL(string: "http://3.36.217.168:8080/works/\(id)")
        let body = try? JSONEncoder().encode(syncData)
        
        var request = URLRequest(url: url!)
        request.httpMethod = httpMethod
        request.httpBody = body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            
            if let error = error {
                print(error)
                return
            }
        }
        task.resume()
    }
    
    static func insertedDataPost(httpMethod: String, data: TaskCard) {
        var syncData = data
        syncData.status += 1
        let url = URL(string: "http://3.36.217.168:8080/works")
        let body = try? JSONEncoder().encode(syncData)
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

