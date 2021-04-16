//
//  NotificationName.swift
//  Todo_List
//
//  Created by Lia on 2021/04/16.
//

import Foundation

extension Notification.Name {
    static let finishNetwork = Notification.Name(rawValue: "finishNetwork")
    static let moveCard = Notification.Name(rawValue: "moveCard")
    static let removeCard = Notification.Name(rawValue: "removeCard")
    static let completeCard = Notification.Name(rawValue: "completeCard")
    static let modifyCard = Notification.Name(rawValue: "modifyCard")
}
