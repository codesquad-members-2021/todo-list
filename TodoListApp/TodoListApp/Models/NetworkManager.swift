//
//  NetworkManager.swift
//  TodoListApp
//
//  Created by Song on 2021/04/06.
//

import Foundation

class NetworkManager {
    //TODO: - Back end와 협의해 handler의 매개변수 타입 수정 필요
    func performRequest(urlString: String, handler: @escaping ([String]) -> ()) {
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            guard let data = data else { return }
            guard let response = response as? HTTPURLResponse, (200..<299) ~= response.statusCode else { return }
            //guard let usernames = JSONParser().parseJSON(data) else { return }
            //handler(usernames)
        }
        task.resume()
    }
}
