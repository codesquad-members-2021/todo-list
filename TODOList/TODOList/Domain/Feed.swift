//
//  Feed.swift
//  TODOList
//
//  Created by 양준혁 on 2021/04/07.
//

import Foundation

class Feed {
    private var cardTitle: String
    private var timeStamp: Date
    private var actionState: ActionState
    
    init(cardTitle: String, timeStamp: Date, actionState: ActionState) {
        self.cardTitle = cardTitle
        self.timeStamp = timeStamp
        self.actionState = actionState
    }
}

enum ActionState {
    case add, remove, update, move
}
