//
//  AddToDoTextFieldDelegate.swift
//  todo-list
//
//  Created by Song on 2021/04/14.
//

import UIKit

class AddToDoTextFieldDelegate: NSObject {

    private let validator: InputValidable
    
    init(validator: InputValidable) {
        self.validator = validator
    }
    
    enum NotiKeys {
        static let validateDone = Notification.Name("validateDone")
    }
    
    private func postNotiValidateDone() {
        NotificationCenter.default.post(name: NotiKeys.validateDone,
                                        object: validator.self,
                                        userInfo: nil)
    }
}

extension AddToDoTextFieldDelegate: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.endEditing(true)
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let input = textField.text ?? ""
        validateCheck(for: input)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let input = textField.text ?? ""
        validateCheck(for: input)
    }
    
    private func validateCheck(for text: String) {
        if validator.isValidated(input: text) {
            postNotiValidateDone()
        }
    }
}
