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
    
    func createCard(with card : Card, type : String, completion: @escaping (Card) -> Void){
        
        /*
         Card 클래스는 dataType을 가질 필요가 없으나
         api 요청시 필요한 인자이므로 임시로 객체를 생성
         */
        let target = CardRequest.init(title: card.title,
                                       content: card.content,
                                       writer: card.writer,
                                       taskType: type)
        
        guard let json = try? JSONEncoder().encode(target) else {
            return
        }
        var request = URLRequest(url: CardAPI.all.url)
        request.httpMethod = HTTPMethod.post.rawValue
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = json
        
        let task : URLSessionTask = session
            .dataTask(with: request) { data, urlResponse, error in
                guard let response = urlResponse as? HTTPURLResponse
                else {
                    print(error ?? ServiceError.unknownError)
                    return
                }
                guard let data = data else {
                    return
                }
                if (400...599).contains(response.statusCode) {
                    print(error ?? ServiceError.network(statusCode: response.statusCode))
                }
                let id = Int(String(data: data, encoding: .utf8)!)!
                card.id = id
                completion(card)
            }
        task.resume()
    }
    func loadAllCards(completion : @escaping (Result<BoardResponse, Error>) -> Void) {
        var request = URLRequest(url: CardAPI.all.url)
        request.httpMethod = HTTPMethod.get.rawValue
        
        let task : URLSessionTask = session
            .dataTask(with: request) { data, urlResponse, error in
                guard let response = urlResponse as? HTTPURLResponse
                else {
                    completion(.failure(error ?? ClientError.unknownError))
                    return
                }
                if (400...599).contains(response.statusCode) {
                    print(error ?? ServiceError.network(statusCode: response.statusCode))
                }
                if let data = data,
                   let cardResponse = try? JSONDecoder().decode(BoardResponse.self, from: data) {
                    completion(.success(cardResponse))
                    return
                }
                completion(.failure(ClientError.unknownError))
            }
        task.resume()
    }
    func patchCard(from : Int, type : String, to : Int){
        let current = String(from)
        let target = String(to)
        let type = String(type)
        let path = "\(current)" + "/" + "\(type)" + "/" + "\(target)"
        
        var request = URLRequest(url: CardAPI.all.url.appendingPathComponent(path))
        request.httpMethod = HTTPMethod.patch.rawValue
        
        let task : URLSessionTask = session
            .dataTask(with: request) { data, urlResponse, error in
                guard let response = urlResponse as? HTTPURLResponse,
                      (200...399).contains(response.statusCode)
                else {
                    print(error ?? ClientError.unknownError)
                    return
                }
            }
        task.resume()
    }
    func deleteCard(with id : Int?){
        guard let id = id else {
            print(ClientError.notIncludeID)
            return
        }
        var request = URLRequest(url: CardAPI.all.url.appendingPathComponent(String(id)))
        request.httpMethod = HTTPMethod.delete.rawValue
        
        let task : URLSessionTask = session
            .dataTask(with: request) { data, urlResponse, error in
                guard let response = urlResponse as? HTTPURLResponse,
                      (200...399).contains(response.statusCode)
                else {
                    print(error ?? ClientError.unknownError)
                    return
                }
            }
        task.resume()
    }
    func updateCard(with card : Card){
        
        guard let json = try? JSONEncoder().encode(card) else {
            return
        }
        var request = URLRequest(url: CardAPI.all.url)
        request.httpMethod = HTTPMethod.put.rawValue
        
        //HTTP Headers
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = json
        
        let task : URLSessionTask = session
            .dataTask(with: request) { data, urlResponse, error in
                
                guard let response = urlResponse as? HTTPURLResponse,
                      (200...399).contains(response.statusCode)
                else {
                    print(error ?? ClientError.unknownError)
                    return
                }
            }
        task.resume()
    }
}
