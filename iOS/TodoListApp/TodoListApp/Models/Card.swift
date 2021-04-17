//
//  Card.swift
//  TodoListApp
//
//  Created by Song on 2021/04/06.
//

import Foundation
import MobileCoreServices

final class Card: NSObject, NSItemProviderWriting, NSItemProviderReading, Codable {
    var title: String
    var notes: String
    let createdAt: Date
    let category: String
    
    init(title: String, notes: String, category: String) {
        self.title = title
        self.notes = notes
        self.createdAt = Date()
        self.category = category
    }
    
    static func object(withItemProviderData data: Data, typeIdentifier: String) throws -> Card {
        let decoder = JSONDecoder()
        do {
            let card = try decoder.decode(Card.self, from: data)
            return card
        } catch {
            fatalError()
        }
    }
    
    static var writableTypeIdentifiersForItemProvider: [String] {
        return [kUTTypeData as String]
    }
    func loadData(withTypeIdentifier typeIdentifier: String,
                  forItemProviderCompletionHandler completionHandler: @escaping (Data?, Error?) -> Void) -> Progress? {
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
    static var readableTypeIdentifiersForItemProvider: [String] {
        return [kUTTypeData as String]
    }
}
