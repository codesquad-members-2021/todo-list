//
//  CardAPI.swift
//  Todo_List
//
//  Created by 박혜원 on 2021/04/12.
//

import Foundation

enum CardsAPI {
    
    static let baseURL = "3.36.140.12:8080/tasks/"
    var path : String { "1" }
    var url : URL { URL(string: CardsAPI.baseURL + path)! }
}

enum APIError: LocalizedError {
    case unknownError
    var errorDescription: String? { "unknown Error"}
}

class CardAPIClient {
    let session : URLSession
    init(session : URLSession = .shared) {
        self.session = session
    }
    
    func fetchData(completion : @escaping (Result<Card, Error>) -> Void) {
        let request = URLRequest(url: CardAPI.)
    }
}
