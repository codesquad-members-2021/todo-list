//
//  Enum.swift
//  Todo_List
//
//  Created by Lia on 2021/04/16.
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
