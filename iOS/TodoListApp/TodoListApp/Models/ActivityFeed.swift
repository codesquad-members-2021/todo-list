//
//  ActivityFeed.swift
//  TodoListApp
//
//  Created by Song on 2021/04/06.
//

import Foundation

class ActivityFeed {
    var userActions: [Activity]
    
    init(userActions: [Activity]) {
        self.userActions = userActions
    }
}
