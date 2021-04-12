//
//  titleTextFieldDelegate.swift
//  ToDoListApp
//
//  Created by 박정하 on 2021/04/12.
//

import UIKit

class TitleTextFieldDelegate : NSObject, UITextFieldDelegate{
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text == "" {
            NotificationCenter.default.post(name: NSNotification.Name("updateTitleTextField"), object: self, userInfo: ["textUpdate" : false])
        }
        else {
            NotificationCenter.default.post(name: NSNotification.Name("updateTitleTextField"), object: self, userInfo: ["textUpdate" : true])
        }
    }
}
