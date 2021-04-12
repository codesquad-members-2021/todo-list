//
//  ModalTextViewDelegate.swift
//  Todo_List
//
//  Created by Lia on 2021/04/12.
//

import UIKit

class ModalDelegate: NSObject, UITextViewDelegate {
        
    private var placeHolder: String
    
    init(placeHolder: String) {
        self.placeHolder = placeHolder
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = ""
            textView.textColor = UIColor.black
        }
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = placeHolder
            textView.textColor = UIColor.lightGray
        }
    }
    
}
