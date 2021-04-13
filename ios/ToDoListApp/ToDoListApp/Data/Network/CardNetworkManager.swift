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
