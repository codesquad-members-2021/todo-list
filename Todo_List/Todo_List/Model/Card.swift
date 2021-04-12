//
//  TaskVO.swift
//  Todo_List
//
//  Created by 박혜원 on 2021/04/08.
//

import Foundation
import MobileCoreServices

/*카드를 Drag & Drop하기 위해 필요한 상속( NSObject, NSItemProviderWriting, NSItemProviderReading, Codable)
 final Class를
 */

final class Card : NSObject, NSItemProviderWriting, NSItemProviderReading, Codable {
    
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
            completionHandler(nil,error)
        }
        
        return progress
    }
    
    static var readableTypeIdentifiersForItemProvider: [String] {
        return [(kUTTypeData) as String]
    }
    
    static func object(withItemProviderData data: Data, typeIdentifier: String) throws -> Card {
        let decoder = JSONDecoder()
        
        //        do {
        let card = try decoder.decode(Card.self, from: data)
        return card
        //        } catch {
        //            return fatalError(error) <- 이 부분이 계속 문제가 되어진다.
        //        }
        
    }
    
    
    var id : Int?
    var title : String
    var content : String
    var writer : String
    var create : Date?
    
    init(title : String, content: String, writer : String){
        self.title = title
        self.content = content
        self.writer = writer
    }
    
    convenience override init(){
        self.init(title : "iOS",
                  content: "implements plus button with jackson in codesquad. test code for content line. Am I right?",
                  writer : "elly")
    }
    
    
}
