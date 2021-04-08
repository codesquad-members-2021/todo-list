//
//  NetworkManager.swift
//  TodoListApp
//
//  Created by Song on 2021/04/06.
//

import Foundation

class NetworkManager {
    func performRequest(urlString: String, handler: @escaping ([Card]) -> ()) {
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            guard let data = data else { return }
            guard let cards = JSONParser.parseJSON(data) else { return }
            handler(cards)
        }
        task.resume()
    }
}
