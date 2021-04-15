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
    
    static func post(category: Int, data: AddCard, completion: @escaping (Result<PostCard, Error>) -> Void) {
        guard let encodingData = ParsingManager.encodeData(data: data) else { return }
        session.dataTask(with: RequestManager.postRequest(category: category, data: encodingData)) { (data, response, error) in
            guard let response = response as? HTTPURLResponse, let data = data else { return }
            if (200 ..< 299) ~= response.statusCode {
                guard let card = ParsingManager.decodeData(type: PostCard.self, data: data) else { return }
                completion(.success(card))
            }else{
                print(response.statusCode)
                completion(.failure(error?.localizedDescription as! Error))
            }
        }.resume()
    }
    
    static func put(category: Int, cardID: Int, data: Data) {
        session.dataTask(with: RequestManager.putRequest(category: category, cardID: cardID, data: data)).resume()
    }

    static func delete(category: Int, cardID: Int, completion: @escaping (Result<DeleteCard, Error>) -> Void) {
        session.dataTask(with: RequestManager.deleteRequest(category: category, cardID: cardID)) { (data, response, error) in
            guard let response = response as? HTTPURLResponse, let data = data else { return }
            if (200 ..< 299) ~= response.statusCode {
                guard let deleteCardInfo = ParsingManager.decodeData(type: DeleteCard.self, data: data) else { return }
                completion(.success(deleteCardInfo))
            }else{
                print(response.statusCode)
                completion(.failure(error?.localizedDescription as! Error))
            }
        }.resume()
    }
}
