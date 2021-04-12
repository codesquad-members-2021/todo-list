//
//  URLSession+Protocol.swift
//  Todo_List
//
//  Created by 박혜원 on 2021/04/12.
//

import Foundation

protocol URLSessionProtocol {
    func dataTask(with request: URLRequest,
                  completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession : URLSessionProtocol {
    
}
