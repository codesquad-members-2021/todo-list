//
//  Networking.swift
//  TODOList
//
//  Created by 양준혁 on 2021/04/07.
//

import Foundation

class Networking {
    let session: URLSession
    
    init() {
        session = .shared
    }
    
    func getToDoList(url: String, completionHandler: @escaping ([Card])->Void) {
        guard let url = URL(string: url) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        SessionManger.request(urlRequest: request) { (data) in
            guard let decodedData = DataManager.decoding(decodable: BundleOfCards.self, data: data) else { return }
            completionHandler(decodedData.cards)
        }
    }
    
    func postToDoList(url: String, cards: [Card], comletionHandler: @escaping ([Card])->Void) {
        guard let url = URL(string: url) else { return }
        var request = URLRequest(url: url)
        let encodedData = DataManager.encoding(encodable: cards)
        request.httpMethod = "POST"
        request.httpBody = encodedData
        SessionManger.request(urlRequest: request) { (data) in
            guard let decodedData = DataManager.decoding(decodable: BundleOfCards.self, data: data) else { return }
            comletionHandler(decodedData.cards)
        }
    }
}
