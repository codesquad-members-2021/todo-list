//
//  DataTaskManager.swift
//  todo-list
//
//  Created by sonjuhyeong on 2021/04/09.
//

import Foundation

class DataTaskManager {
    
    static let session = URLSession(configuration: .default)
    
    static func request(completion: @escaping (Result<CardList, Error>) -> Void) {
        session.dataTask(with: RequestManager.get(url: "https://fc14a707-47df-4e09-9fb0-84045a2d8469.mock.pstmn.io/todos")) { data, response, error in
            if let data = data {
                guard let cardList = ParsingManager.decodeData(type: CardList.self, data: data) else { return }

                completion(.success(cardList))
            } else {
                completion(.failure(error?.localizedDescription as! Error))
            }
        }.resume()
    }
}
