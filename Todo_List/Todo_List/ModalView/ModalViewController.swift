//
//  ModalViewController.swift
//  Todo_List
//
//  Created by Lia on 2021/04/08.

import UIKit

class ModalViewController: UIViewController {

    @IBOutlet var modalViewTitleLable: UILabel!
    @IBOutlet var titleTextView: UITextView!
    @IBOutlet var contentTextView: UITextView!
    
    let titlePlaceHolder = "제목을 입력하세요"
    let contentPlaceHolder = "내용을 입력하세요"
    
    private lazy var titleDelegate = ModalDelegate(placeHolder: titlePlaceHolder)
    private lazy var contentDelegate = ModalDelegate(placeHolder: contentPlaceHolder)
    
    private var cards: [TodoCard]!
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?,_ cards: [TodoCard]) {
        self.cards = cards
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextView()
    }
    
    //MARK:- Method
    
    private func setTextView() {
        setPlaceHolder(   titleTextView, titleDelegate, text: titlePlaceHolder, .lightGray)
        setPlaceHolder(contentTextView, contentDelegate, text: contentPlaceHolder, .lightGray)
    }
    
    private func setPlaceHolder(_ textView: UITextView, _ delegate: UITextViewDelegate, text: String, _ textColor: UIColor) {
        textView.delegate = delegate
        textView.text = text
        textView.textColor = textColor
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.sizeToFit()
    }
    
    @IBAction func cancelButtonTouched(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func registerButtonTouched(_ sender: UIButton) {
        //noti
//        let card = TodoCard(title: titleTextView.text ?? "", content: contentTextView.text ?? "", postTime: "\(Date())", user: User())
//        self.cards.addCard(with: card)
        dismiss(animated: true, completion: nil)
    }
    
}

