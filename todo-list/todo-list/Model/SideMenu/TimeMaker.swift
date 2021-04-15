//
//  TimeMaker.swift
//  todo-list
//
//  Created by Song on 2021/04/15.
//

import Foundation

struct TimeMaker {
    
    static func timeStringFrom(date: Date) -> String {
        let time = Int(Date().timeIntervalSince(date) / 60)
        
        return time > 0 ? "\(time)분 전" : "방금 전"
    }
    
}
