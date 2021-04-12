//
//  APIError.swift
//  Todo_List
//
//  Created by 박혜원 on 2021/04/12.
//

import Foundation

enum APIError: LocalizedError {
    case unknownError
    var errorDescription: String? { "unknown Error"}
}
