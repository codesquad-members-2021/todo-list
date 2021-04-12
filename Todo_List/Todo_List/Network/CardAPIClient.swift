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
    
    func loadAllCards(completion : @escaping (Result<[Card], Error>) -> Void) {
        let request = URLRequest(url: CardAPI.all.url)
        
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
    func deleteCard(){
        
    }
    func createCard(with card : Card){
        
        guard let json = try? JSONEncoder().encode(card) else {
            return
        }
        var request = URLRequest(url: CardAPI.all.url)
        request.httpMethod = "POST"
        
        //HTTP Headers
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("applicatoin/json", forHTTPHeaderField: "Accept")
        request.httpBody = json
        
        let task : URLSessionTask = session
            .dataTask(with: request) { data, urlResponse, error in
            
                guard let response = urlResponse as? HTTPURLResponse,
                      (200...399).contains(response.statusCode)
                else {
                    print(error ?? APIError.unknownError)
                    return
                }
            }
        task.resume()
    }
}
