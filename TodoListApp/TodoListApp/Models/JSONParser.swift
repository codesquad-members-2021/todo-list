//
//  JSONParser.swift
//  TodoListApp
//
//  Created by Song on 2021/04/06.
//

import Foundation

class JSONParser {
    static func parseJSON(_ todoData: Data) -> [Card]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([TodoData].self, from: todoData)
            let cards = decodedData.map { (todoData) in
                Card(title: todoData.title, description: todoData.contents)
            }
            return cards
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
