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
}

