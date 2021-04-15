//
//  NetworkManager.swift
//  Todo_List
//
//  Created by Lia on 2021/04/15.
//

import Foundation

enum NetworkError: Int, Error {
    case DecodeError
    case EncodeError
    case BadURL
    case ResponseFailed
    case BadRequest = 400 // 문법상 오류로 서버가 요청을 이해하지 못함
    case NotFound = 404 // 클라이언트가 요청한 문서를 찾지 못한 경우
    case InvalidFormat = 405// 지원되지 않은 형식으로, 서버가 요청 승인 거부 (content-type 확인 필요 혹은 header miss?)
    case ServerError = 500 // 서버 내부 오류
    case Unknown
}

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum EndPoint: String {
    case home = "http://ec2-3-34-172-226.ap-northeast-2.compute.amazonaws.com:8080/list"
    case history = "http://ec2-3-34-172-226.ap-northeast-2.compute.amazonaws.com:8080/history"
    case modify = "http://ec2-3-34-172-226.ap-northeast-2.compute.amazonaws.com:8080/cards"
}


class NetworkManager {
    private let decoder = DecodeManager()
    private let encoder = EncodeManager()
    
    func getSource<T:Decodable>(urlString: String, httpMethod: HttpMethod, json: Data? = nil, dataType: T.Type, completion: @escaping (Any?,NetworkError?) -> Void) {
        
        perfomRequest(urlString: urlString, httpMethod: httpMethod, json: json, dataType: dataType) { result in
            switch result {
            case .success(let data):
                print("🎉", data)
                completion(data, nil)

            case .failure(let error):
                print(error)
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
                    self.decoder.decode(json: data, dataType: dataType) { completion($0) }
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
//        request.setValue("jwtToken", forHTTPHeaderField: jwtToken)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                if json != nil {
                    request.setValue(String(json!.count), forHTTPHeaderField: "Content-Length") }
        return request
    }
    
    func encodeJson<T:Encodable>(anyData: T, completion: @escaping (Any?,NetworkError?) -> Void) {
        encoder.encode(anyData: anyData) { (result) in
            switch result {
            case .success(let data):
                completion(data, nil)

            case .failure(let error):
                print(error)
                completion(nil, error)
            }
        }
    }
}

class DecodeManager {
    
    // json data, T.type -> result<T.type,error>
    func decode<T:Decodable>(json: Data, dataType: T.Type, completion: @escaping (Result<Any,NetworkError>) -> Void) {
        let decoder = JSONDecoder()
        guard let data = try? decoder.decode(dataType, from: json) else {
            completion(.failure(.DecodeError))
            return
        }
        completion(.success(data))
    }
    

}

class EncodeManager {
    
    func encode<T:Encodable>(anyData: T, completion: @escaping (Result<Any,NetworkError>) -> Void) {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        guard let data = try? encoder.encode(anyData) else {
            completion(.failure(.EncodeError))
            return
        }
        completion(.success(data))
    }
}
