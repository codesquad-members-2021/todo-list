//
//  ModalViewController.swift
//  Todo_List
//
//  Created by Lia on 2021/04/08.
//

import UIKit

class ModalViewController: UIViewController {

    @IBOutlet var modalViewTitleLable: UILabel!
    @IBOutlet var titleTextView: UITextView!
    @IBOutlet var contentTextView: UITextView!
    
    let titlePlaceHolder = "제목을 입력하세요"
    let contentPlaceHolder = "내용을 입력하세요"
    
    private lazy var titleDelegate = ModalDelegate(placeHolder: titlePlaceHolder)
    private lazy var contentDelegate = ModalDelegate(placeHolder: contentPlaceHolder)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextView()
    }
    
    func setTextView() {
        setPlaceHolder(titleTextView, titleDelegate, text: titlePlaceHolder, .lightGray)
        setPlaceHolder(contentTextView, contentDelegate, text: contentPlaceHolder, .lightGray)
    }
    
    private func setPlaceHolder(_ textView: UITextView, _ delegate: UITextViewDelegate, text: String, _ textColor: UIColor) {
        textView.delegate = delegate
        textView.text = text
        textView.textColor = textColor
        
        textView.translatesAutoresizingMaskIntoConstraints = true
        textView.sizeToFit()
        textView.isScrollEnabled = false
    }
    
}

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
