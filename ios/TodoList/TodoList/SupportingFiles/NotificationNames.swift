//
//  NotificationNames.swift
//  TodoList
//
//  Created by 조중윤 on 2021/04/13.
//

import Foundation

extension Notification.Name {
    static let didChangeToDoCardsList = Notification.Name("didChangeToDoCardsList")
    static let didChangeDoingCardsList = Notification.Name("didChangeDoingCardsList")
    static let didChangeCompletedCardsLists = Notification.Name("didChangeCompletedCardsLists")
}
