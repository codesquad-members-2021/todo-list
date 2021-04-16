//
//  ToDoDataModel.swift
//  TodoList
//
//  Created by Jun Ho JANG on 2021/04/06.
//

import Foundation
import MobileCoreServices

struct ToDoList: Codable {
    let todo: [ToDoItem]
    let doing: [ToDoItem]
    let done: [ToDoItem]
}

final class ToDoItem: NSObject, Codable, NSItemProviderReading, NSItemProviderWriting {
    let id: Int
    let title: String
    let contents: String
    let createDateTime: String
    let status: String
    
    init(id: Int, title: String, contents: String, createDateTime: String, status: String) {
        self.id = id
        self.title = title
        self.contents = contents
        self.createDateTime = createDateTime
        self.status = status
    }
    
    static var readableTypeIdentifiersForItemProvider: [String] {
        return [(kUTTypeData) as String]
    }

    static func object(withItemProviderData data: Data, typeIdentifier: String) throws -> ToDoItem {
        let decoder = JSONDecoder()
        do {
            let model = try decoder.decode(ToDoItem.self, from: data)
            return model
        } catch {
            fatalError()
        }
    }

    static var writableTypeIdentifiersForItemProvider: [String] {
        return [(kUTTypeData) as String]
    }
    
    func loadData(withTypeIdentifier typeIdentifier: String, forItemProviderCompletionHandler completionHandler: @escaping (Data?, Error?) -> Void) -> Progress? {
        let progress = Progress(totalUnitCount: 100)
        do {
            let data = try JSONEncoder().encode(self)
            progress.completedUnitCount = 100
            completionHandler(data, nil)
        } catch {
            completionHandler(nil, error)
        }
        return progress
    }
}
