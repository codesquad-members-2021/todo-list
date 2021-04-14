//
//  Interface.swift
//  todo-list
//
//  Created by Song on 2021/04/14.
//

import Foundation

protocol InputValidable {
    
    func isValidated(input: String) -> Bool
    
    func validatedText() -> String?
    
}
