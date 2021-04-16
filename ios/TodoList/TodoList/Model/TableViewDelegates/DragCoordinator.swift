//
//  DragCoordinator.swift
//  TodoList
//
//  Created by Jun Ho JANG on 2021/04/15.
//

import Foundation

class DragCoordinator {
    let sourceIndexPath: IndexPath
    var dragCompleted = false
    var isReordering = false
    
    init(sourceIndexPath: IndexPath) {
        self.sourceIndexPath = sourceIndexPath
    }
}
