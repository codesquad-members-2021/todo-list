//
//  ContentTextFieldDelegate.swift
//  ToDoListApp
//
//  Created by 박정하 on 2021/04/12.
//

import UIKit

class ContentTextFieldDelegate : NSObject, UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField){
        if textField.text == "" {
            NotificationCenter.default.post(name: NSNotification.Name("updateContentTextField"), object: self, userInfo: ["textUpdate" : false])
        }
        else {
            NotificationCenter.default.post(name: NSNotification.Name("updateContentTextField"), object: self, userInfo: ["textUpdate" : true])
        }
    }
}
