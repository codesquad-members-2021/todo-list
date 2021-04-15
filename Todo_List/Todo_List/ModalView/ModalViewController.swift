//
//  ModalViewController.swift
//  Todo_List
//
//  Created by Lia on 2021/04/08.

import UIKit

class ModalViewController: UIViewController {

    enum Mode: String {
        case register = "새로운 카드 추가"
        case modify = "카드 수정"
    }
    
    @IBOutlet var modalViewTitleLable: UILabel!
    @IBOutlet var titleTextView: UITextView!
    @IBOutlet var contentTextView: UITextView!
    @IBOutlet weak var requestButton = UIButton()
    
    let titlePlaceHolder = "제목을 입력하세요"
    let contentPlaceHolder = "내용을 입력하세요"
    
    private lazy var titleDelegate = ModalDelegate(placeHolder: titlePlaceHolder)
    private lazy var contentDelegate = ModalDelegate(placeHolder: contentPlaceHolder)
    
    private let mode: Mode!
    private let status: String?
    private let cardId: Int?
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, mode: Mode, status: String?, cardId: Int?) {
        self.mode = mode
        self.status = status
        self.cardId = cardId
        self.modalViewTitleLable = UILabel()
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        self.mode = .none
        self.status = ""
        self.cardId = 0
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        self.modalViewTitleLable.text = mode.rawValue
        self.requestButton?.setTitle(mode == .register ? "등록" : "수정", for: .normal)
        setTextView()

        super.viewDidLoad()
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
        switch self.mode {
        case .modify:
            modifyCard(cardNum: self.cardId!)
        case .register:
            self.registerCard()
        default:
            break
        }
        
        dismiss(animated: true, completion: nil)
    }

    private func registerCard() {
        let card = CreateCard(title: titleTextView.text ?? "", contents: contentTextView.text ?? "", status: self.status!)
        
        NetworkHandler.post(anydata: card, url: EndPoint.modify.rawValue, httpMethod: .post)
        NetworkHandler.get(urlString: EndPoint.home.rawValue, dataType: TodoCards.self)
    }
    
    private func modifyCard(cardNum: Int) {
        let modifyCard = ModifyCard(title: titleTextView.text ?? "", contents: contentTextView.text ?? "")
        let url = "\(EndPoint.modify.rawValue)/\(cardNum)/edit"
        
        NetworkHandler.post(anydata: modifyCard, url: url, httpMethod: .put)
        NetworkHandler.get(urlString: EndPoint.home.rawValue, dataType: TodoCards.self)
    }
    
}

