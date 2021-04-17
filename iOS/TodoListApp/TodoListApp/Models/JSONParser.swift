//
//  JSONParser.swift
//  TodoListApp
//
//  Created by Song on 2021/04/06.
//

import Foundation

class JSONParser {
    static func parse(_ todoData: Data) -> [Card]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([TodoData].self, from: todoData)
            let cards = decodedData.map { (todoData) -> Card in
                let title = todoData.title
                let notes = todoData.contents
                var category = ""
                switch (todoData.todo, todoData.doing, todoData.done) {
                case (true, false, false):
                    category = "todo"
                case (false, true, false):
                    category = "doing"
                case (false, false, true):
                    category = "done"
                default:
                    category = "error"
                }
                return Card(title: title, notes: notes, category: category)
            }
            return cards
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
