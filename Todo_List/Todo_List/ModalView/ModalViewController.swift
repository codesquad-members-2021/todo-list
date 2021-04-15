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
    private let status: String!
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?,_ cards: [TodoCard], status: String) {
        self.cards = cards
        self.status = status
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        self.status = "" //⚠️
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextView()
    }
    
    //MARK:- Method
    
    private func setTextView() {
        setPlaceHolder(titleTextView, titleDelegate, text: titlePlaceHolder, .lightGray)
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
        let card = CreateCard(title: titleTextView.text ?? "", contents: contentTextView.text ?? "", status: self.status)
        NetworkManager().encodeJson(anyData: card) { (data, error) in
            NetworkManager().getSource(urlString: EndPoint.modify.rawValue, httpMethod: .post, json: data as? Data, dataType: Decode.self) { (data, error) in
                if error != nil { print("🔥",error!) }
                else {print( data!)}
            }
        }
        NetworkHandler.get(urlString: EndPoint.modify.rawValue, dataType: TodoCards.self)
        
        dismiss(animated: true, completion: nil)
    }

}

