//
//  JSONParser.swift
//  TodoListApp
//
//  Created by Song on 2021/04/06.
//

import Foundation

class JSONParser {
    //TODO: - Back end와 협의해 return 타입 수정 필요
    //TODO: - JSONSerialization 대신 JSONDecoder 이용
    func parseJSON(_ userData: Data) -> [String]? {
        do {
            guard let jsonObject = try JSONSerialization.jsonObject(with: userData) as? [String] else {
                return nil
            }
            return jsonObject
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
