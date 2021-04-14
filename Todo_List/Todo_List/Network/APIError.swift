//
//  APIError.swift
//  Todo_List
//
//  Created by 박혜원 on 2021/04/12.
//

import Foundation

enum APIError: String, LocalizedError {
    case unknownError = "unknown Error"
    case notIncludeID = "ID가 없습니다."
    var errorDescription: String? { self.rawValue }
}
