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

    func getCards() -> AnyPublisher<[ToDo], Error>
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
    
    func getCards() -> AnyPublisher<[ToDo], Error> {
        let endpoint = Endpoint.cards

        return networkManager.get(type: [ToDo].self, url: endpoint.url)
    }
}

