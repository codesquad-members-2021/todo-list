//
//  NetworkManager.swift
//  Todo_List
//
//  Created by Lia on 2021/04/15.
//

import Foundation

class NetworkHandler {
    static func post<T:Codable>(anydata: T, url: String, httpMethod: HttpMethod) {
        NetworkManager().encodeJson(anyData: anydata) { (data, error) in
            NetworkManager().getSource(urlString: url, httpMethod: httpMethod, json: data as? Data, dataType: Decode.self) { (data, error) in
                NotificationCenter.default.post(name: .finishNetwork, object: nil)
            }
        }
    }
}


class NetworkManager {
    
    func getSource<T:Decodable>(urlString: String, httpMethod: HttpMethod, json: Data? = nil, dataType: T.Type, completion: @escaping (Any?,NetworkError?) -> Void) {
        
        perfomRequest(urlString: urlString, httpMethod: httpMethod, json: json, dataType: dataType) { result in
            switch result {
            case .success(let data):
                completion(data, nil)

            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    private func perfomRequest<T:Decodable>(urlString: String, httpMethod: HttpMethod, json: Data? = nil, dataType: T.Type, completion: @escaping (Result<Any,NetworkError>) -> Void) {
        
        guard let url = URL(string: urlString) else { completion(.failure(.BadURL)); return }
        let request = createRequest(url: url, httpMethod: httpMethod, json: json)
        
        URLSession.shared.dataTask(with: request) {data, response, error in
            DispatchQueue.main.async {
                guard let httpResponse = response as? HTTPURLResponse, let data = data else {
                    completion(.failure(.ResponseFailed))
                    return
                }
                
                switch httpResponse.statusCode {
                case 200:
                    DecodeManager.decode(json: data, dataType: dataType) { completion($0) }
                case 400, 404, 405, 500:
                    completion(.failure(NetworkError(rawValue: httpResponse.statusCode) ?? .Unknown))
                default:
                    completion(.failure(.Unknown))
                    fatalError("Unhandled HTTP status code: \(httpResponse.statusCode)")
                }
            }
        }.resume()
    }
    
    private func createRequest(url: URL, httpMethod: HttpMethod, json: Data? = nil) -> URLRequest {
        var request = URLRequest(url: url)
        
        request.httpMethod = httpMethod.rawValue
        request.httpBody = json
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        if json != nil { request.setValue(String(json!.count), forHTTPHeaderField: "Content-Length") }
        
        return request
    }
    
    func encodeJson<T:Encodable>(anyData: T, completion: @escaping (Any?,NetworkError?) -> Void) {
        EncodeManager.encode(anyData: anyData) { (result) in
            switch result {
            case .success(let data):
                completion(data, nil)

            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
