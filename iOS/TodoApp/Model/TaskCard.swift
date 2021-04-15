//  Created by 김지선 on 2021/04/09.
import Foundation
import MobileCoreServices

final class TaskCard: NSObject, NSItemProviderWriting, NSItemProviderReading, Codable {
    
    static var writableTypeIdentifiersForItemProvider: [String] {
        return [(kUTTypeData as String)]
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
    
    static var readableTypeIdentifiersForItemProvider: [String] {
        return [(kUTTypeData) as String]
    }
    
    static func object(withItemProviderData data: Data, typeIdentifier: String) throws -> TaskCard {
        let decoder = JSONDecoder()
        let card = try decoder.decode(TaskCard.self, from: data)
        return card
    }
    
    
    var id: Int
    var title: String
    var content: String
    var createdAt: String
    var status: Int
    var author: String
    
    init(id: Int, title: String, content: String, createdAt: String, status: Int, author: String) {
        self.id = id
        self.title = title
        self.content = content
        self.createdAt = createdAt
        self.status = status
        self.author = author
    }
}
