//
//  DataRetriever.swift
//  TodoList
//
//  Created by Jun Ho JANG on 2021/04/06.
//

import Foundation

class DataManager {
    
    static func getData(urlString: String, completion: @escaping (String) -> ()) {
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    let result = JSONParser.parseData(data: data)!
                    print(result)
                    completion(result.getTitleString())
                }
            }.resume()
        }
    }
    
}
