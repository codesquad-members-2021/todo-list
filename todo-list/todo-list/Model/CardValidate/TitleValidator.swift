//
//  TitleValidator.swift
//  todo-list
//
//  Created by Song on 2021/04/14.
//

import Foundation

class TitleValidator: InputValidable {
    
    private var title: String?
    
    func isValidated(input: String) -> Bool {
        if input.count >= 1 {
            self.title = input
            return true
        } else {
            self.title = nil
            return false
        }
    }
    
    func validatedText() -> String? {
        return title
    }

}
