//
//  CardAPIClient.swift
//  Todo_List
//
//  Created by 박혜원 on 2021/04/12.
//

import Foundation

class CardAPIClient {
    let session : URLSession
    init(session : URLSession = .shared) {
        self.session = session
    }
    
    func fetchData(completion : @escaping (Result<[Card], Error>) -> Void) {
        let url = URL(string: "http://3.36.140.12:8080/tasks/")!
        let request = URLRequest(url: url)
        
        let task : URLSessionTask = session
            .dataTask(with: request) { data, urlResponse, error in
                guard let response = urlResponse as? HTTPURLResponse,
                      (200...399).contains(response.statusCode)
                else {
                    completion(.failure(error ?? APIError.unknownError))
                    return
                }
                
                if let data = data,
                   let cardResponse = try? JSONDecoder().decode([Card].self, from: data) {
                    completion(.success(cardResponse))
                    return
                }
                completion(.failure(APIError.unknownError))
            }
        task.resume()
    }
}
