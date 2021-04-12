//
//  CardFactory.swift
//  TODOList
//
//  Created by Issac on 2021/04/12.
//

import Foundation

class CardFactory {
    static public func makeCard(title: String, contents: String, mode: SectionMode) -> Card {
        return Card(id: 0, title: title, contents: contents, columnId: mode.rawValue, createdDateTime: Date())
    }
    
    static public func makeCard(title: String, contents: String, mode: SectionMode, date: Date) -> Card {
        return Card(id: 0, title: title, contents: contents, columnId: mode.rawValue, createdDateTime: date)
    }
}
