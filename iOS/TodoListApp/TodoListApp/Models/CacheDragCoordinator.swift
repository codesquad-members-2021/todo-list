//
//  CacheDragCoordinator.swift
//  TodoListApp
//
//  Created by Song on 2021/04/14.
//

import Foundation

class CacheDragCoordinator {
    let sourceIndexPath: IndexPath
    var dragCompleted = false
    var isReordering = false
    
    init(sourceIndexPath: IndexPath) {
        self.sourceIndexPath = sourceIndexPath
    }
}
