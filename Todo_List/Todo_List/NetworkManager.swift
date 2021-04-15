//
//  NetworkManager.swift
//  Todo_List
//
//  Created by Lia on 2021/04/15.
//

import Foundation

enum NetworkError: Int, Error {
    case DecodeError
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
    
    func perfomRequest<T:Decodable>(urlString: String, httpMethod: HttpMethod, json: Data? = nil, dataType: T.Type, completion: @escaping (Result<Any,NetworkError>) -> Void) {
        
        guard let url = URL(string: urlString) else { completion(.failure(.BadURL)); return }
        let request = createRequest(url: url, httpMethod: httpMethod)
        
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
        
        return request
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
