//  Created by 김지선 on 2021/04/12.
import Foundation

class NetworkManager {
    
    static func loginPost(id: String, password: String) {
        let data = ["userId" : id, "password" : password]
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
                    self.fetchTaskData()
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }

    static func fetchTaskData() {
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

        let url = URL(string: "http://3.36.217.168:8080/works/\(id)")
        let body = try? JSONEncoder().encode(data)
        
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
        let syncData = data
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
    
    static func fetchHistoryData() {
        let url = URL(string: "http://3.36.217.168:8080/timelines")
        var request = URLRequest(url: url!)
        request.httpMethod = HTTPMethod.get
                
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            print(response)
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
                        let historyLog = task["content"] as! String
                        let createdAt = task["createdAt"] as! String
                        let time = extractDate(createdAt)
                        let author = task["author"] as! String
                        let historyCard = HistoryCard(author: author, historyLog: historyLog, time: time)
                        NotificationCenter.default.post(name: .addHistory, object: self, userInfo: ["historyCard": historyCard])
                    }
                } catch let error as NSError {
                    print(error)
                }
            }
        }
        task.resume()
        }
    
    static func extractDate(_ createdAt: String) -> String {
        let syncDate = createdAt.replacingOccurrences(of: "T", with: " ")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: syncDate)
        let calender = Calendar.current
        let year = calender.component(.year, from: date!)
        let month = calender.component(.month, from: date!)
        let day = calender.component(.day, from: date!)
        let hour = calender.component(.hour, from: date!)
        let minute = calender.component(.minute, from: date!)
        
        if calender.isDateInToday(date!) {
            return "오늘 \(hour):\(minute)"
        } else {
            return "\(year).\(month).\(day)"
        }
    }
}

