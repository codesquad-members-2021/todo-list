//
//  NotificationNames.swift
//  TodoList
//
//  Created by 조중윤 on 2021/04/13.
//

import Foundation

extension Notification.Name {
    static let didChangeToDoItemList = Notification.Name("didChangeToDoItemList")
    static let didChangeDoingItemList = Notification.Name("didChangeDoingItemList")
    static let didChangeDoneItemList = Notification.Name("didChangeDoneItemList")
    static let didChangeSideMenuToggle = Notification.Name("didChangeSideMenuToggle")
}
