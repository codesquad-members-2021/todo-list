//
//  TodoCard.swift
//  Todo_List
//
//  Created by Lia on 2021/04/06.
//

import Foundation
import MobileCoreServices

class TodoCard{//}: NSObject, Codable, NSItemProviderWriting, NSItemProviderReading {
    
//    static var writableTypeIdentifiersForItemProvider: [String] {
//        
//        return [kUTTypeData as String]
//    }
//    
//    
//    func loadData(withTypeIdentifier typeIdentifier: String, forItemProviderCompletionHandler completionHandler: @escaping (Data?, Error?) -> Void) -> Progress? {
//        
//        let progress = Progress(totalUnitCount: 100)
//        
//        do {
//            let encoder = JSONEncoder()
//            encoder.outputFormatting = .prettyPrinted
//            let data = try encoder.encode(self)
//            let json = String(data: data, encoding: .utf8)
//            progress.completedUnitCount = 100
//            completionHandler(data, nil)
//        } catch {
//            completionHandler(nil,error)
//        }
//        return progress
//    }
//    
//    static var readableTypeIdentifiersForItemProvider: [String] {
//        return [kUTTypeData as String]
//    }
//    
//    static func object(withItemProviderData data: Data, typeIdentifier: String) throws -> Self {
//        let decoder = JSONDecoder()
//        do {
//            let myJson = try decoder.decode(self, from: data)
//            return myJson
//        } catch {
//            fatalError("err")
//        }
//    }
    
    
    private(set) var title: String
    private(set) var content: String
    private(set) var postTime: String
    private var user: User
    
    init(title: String, content: String, postTime: String, user: User) {
        self.title = title
        self.content = content
        self.postTime = postTime
        self.user = user
    }
    
    convenience init() {
        let title = "title"
        let content = "content"
        let postTime = "2021.04.08"
        let user = User()
        self.init(title: title, content: content, postTime: postTime, user: user)
    }
    
}


