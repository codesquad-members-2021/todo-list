//
//  CardNetworkManager.swift
//  ToDoListApp
//
//  Created by zombietux on 2021/04/08.
//

import Foundation
import Combine

protocol CardNetworkManagerProtocol: class {
    var networkManager: HttpMethodProtocol { get }

    func getCards(state: State) -> AnyPublisher<[Card], Error>
    func postCards(title: String, contents: String) -> AnyPublisher<[Card], Error>
}

class CardNetworkManager: CardNetworkManagerProtocol {
    var networkManager: HttpMethodProtocol
    
    init(networkManager: HttpMethodProtocol) {
        self.networkManager = networkManager
    }
    
    convenience init() {
        let networkManager = NetworkManager()
        self.init(networkManager: networkManager)
    }
    
    func getCards(state: State) -> AnyPublisher<[Card], Error> {
        let endpoint = Endpoint.cards(state: state)
        return networkManager.get(type: [Card].self, url: endpoint.url)
    }
    
    func postCard(title: String, contents: String) {
        let url = URL(string: "http://localhost:3000/cards/2")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let body = try? JSONEncoder().encode(postTest(title: "해위", contents: "해위2"))
        request.httpBody = body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//                 request.addValue("application/json", forHTTPHeaderField: "Accept")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            print(data)
            print(response)
            print(error)
            guard let pasingData = data else {
                
                return
            }
            let data = try! JSONDecoder().decode([postTest].self, from: pasingData)
            print(data)
            print("루루루루")
        }.resume()
    }
    
    func postCards(title: String, contents: String) -> AnyPublisher<[Card], Error> {
        return networkManager.post(title: "해위", contents: "해위2", url: URL(string: "http://localhost:3000/cards/2")!)
    }
}

struct postTest: Codable {
    var id: Int?
    var title: String
    var contents: String
    var columnId: Int?
}
