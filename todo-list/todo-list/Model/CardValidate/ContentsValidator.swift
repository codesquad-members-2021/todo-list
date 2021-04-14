//
//  ContentsValidator.swift
//  todo-list
//
//  Created by Song on 2021/04/14.
//

import Foundation

class ContentsValidator: InputValidable {
    
    private var contents: String?
    
    func isValidated(input: String) -> Bool {
        if input.count > 1 && input.count < 100 {
            self.contents = input
            return true
        } else {
            self.contents = nil
            return false
        }
    }
    
    func validatedText() -> String? {
        return contents
    }

}
