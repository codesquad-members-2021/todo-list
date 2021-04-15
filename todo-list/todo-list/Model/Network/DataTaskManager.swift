//
//  DataTaskManager.swift
//  todo-list
//
//  Created by sonjuhyeong on 2021/04/09.
//

import Foundation

class DataTaskManager {
    
    static let session = URLSession(configuration: .default)
    
    static func get(completion: @escaping (Result<CardData, Error>) -> Void) {
        session.dataTask(with: RequestManager.getRequest()) { data, response, error in
            if let data = data {
                guard let cardList = ParsingManager.decodeData(type: CardData.self, data: data) else { return }
                completion(.success(cardList))
            } else {
                completion(.failure(error?.localizedDescription as! Error))
            }
        }.resume()
    }
    
    static func post(category: Int, data: AddCard) {
        guard let encodingData = ParsingManager.encodeData(data: data) else { return }
        session.dataTask(with: RequestManager.postRequest(category: category, data: encodingData)).resume()
    }
    
    static func put(category: Int, cardID: Int, data: Data) {
        session.dataTask(with: RequestManager.putRequest(category: category, cardID: cardID, data: data)).resume()
    }

    static func delete(category: Int, cardID: Int) {
        session.dataTask(with: RequestManager.deleteRequest(category: category, cardID: cardID)).resume()
    }
}
