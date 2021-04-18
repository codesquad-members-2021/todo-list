//
//  Interfaces.swift
//  todo-list
//
//  Created by Song on 2021/04/15.
//

import Foundation

protocol TaskFinddable {
    
    func count() -> Int
    
    func taskAt(index: Int) -> Task
    
}
