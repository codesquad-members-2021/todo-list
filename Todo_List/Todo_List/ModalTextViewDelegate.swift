//
//  ModalTextViewDelegate.swift
//  Todo_List
//
//  Created by Lia on 2021/04/12.
//

import Foundation

class ModalDelegate: NSObject, UITextViewDelegate {
        
    private var placeHolder: String
    
    init(placeHolder: String) {
        self.placeHolder = placeHolder
    }
    
    // TextView Place Holder
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = ""
            textView.textColor = UIColor.black
        }
        
    }
    // TextView Place Holder
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = placeHolder
            textView.textColor = UIColor.lightGray
        }
    }
    
}
