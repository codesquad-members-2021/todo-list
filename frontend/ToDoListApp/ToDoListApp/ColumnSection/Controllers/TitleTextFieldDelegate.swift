//
//  TitleTextFieldDelegate.swift
//  ToDoListApp
//
//  Created by 박정하 on 2021/04/10.
//

import UIKit

class TitleTextFieldDelegate : NSObject, UITextFieldDelegate {
    private let cardAddManager : CardAddManager!
    
    override init() {
        cardAddManager = CardAddManager()
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        cardAddManager.addCard()
    }
}
