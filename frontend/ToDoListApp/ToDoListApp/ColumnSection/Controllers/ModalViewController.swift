//
//  ModalView.swift
//  ToDoListApp
//
//  Created by 박정하 on 2021/04/10.
//

import UIKit

class ModalViewController : UIViewController {
    @IBOutlet weak private var addButton: UIButton!
    @IBOutlet weak private var CancelButton: UIButton!
    @IBOutlet weak private var titleTextField: UITextField!
    @IBOutlet weak private var contentTextField: UITextField!
    
    private var isTitleTextFieldNil : Bool
    private var isContentTextFieldNil : Bool
    
    private let titleTextFieldDelegate : UITextFieldDelegate
    private let contentTextFieldDelegate : UITextFieldDelegate
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        isTitleTextFieldNil = false
        isContentTextFieldNil = false
        titleTextFieldDelegate = TitleTextFieldDelegate()
        contentTextFieldDelegate = ContentTextFieldDelegate()
        self.titleTextField.delegate = titleTextFieldDelegate
        self.contentTextField.delegate = contentTextFieldDelegate
        super.init(nibName: nil, bundle: nil)
        initObservers()
    }
    
    required init?(coder: NSCoder) {
        isTitleTextFieldNil = false
        isContentTextFieldNil = false
        titleTextFieldDelegate = TitleTextFieldDelegate()
        contentTextFieldDelegate = ContentTextFieldDelegate()
        super.init(coder: coder)
        initObservers()
    }
    
    override func viewDidLoad() {
        self.titleTextField.delegate = titleTextFieldDelegate
        self.contentTextField.delegate = contentTextFieldDelegate
        super.viewDidLoad()
    }
    
    @IBAction func addCard(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("addCard"), object: self)
    }
    
    @IBAction func inActiveNewCardForm(_ sender: Any) {
        set(active: false)
    }
    
    func set(active : Bool){
        self.dismiss(animated: active, completion: nil)
    }
    
    func makeCellData() -> CellData{
        guard let titlefieldText = titleTextField.text,
              let contentFieldText = contentTextField.text
        else { return CellData.init(cardId: 0, title: "", content: "", isApp: false, createdTime: "", position: 0) }
        
        let cellData : CellData = CellData.init(cardId: 0, title: titlefieldText, content: contentFieldText, isApp: false, createdTime: "", position: 0)
        return cellData
    }
}

extension ModalViewController {
    
    private func initObservers(){
        NotificationCenter.default.addObserver(self, selector: #selector(setTitleBool(notification:)), name: NSNotification.Name("updateTitleTextField"), object: titleTextFieldDelegate)
        NotificationCenter.default.addObserver(self, selector: #selector(setContentBool(notification:)), name: NSNotification.Name("updateContentTextField"), object: contentTextFieldDelegate)
    }

    @objc private func setTitleBool(notification: Notification){
        guard let tempuserInfo : Bool = notification.userInfo?["textUpdate"] as? Bool else {return}
        self.isTitleTextFieldNil = tempuserInfo
        if isContentTextFieldNil && isTitleTextFieldNil{
            self.addButton.isEnabled = true
        }
        else {
            self.addButton.isEnabled = false
        }
    }
    
    @objc private func setContentBool(notification: Notification){
        guard let tempuserInfo : Bool = notification.userInfo?["textUpdate"] as? Bool else {return}
        self.isContentTextFieldNil = tempuserInfo
        if isContentTextFieldNil && isTitleTextFieldNil{
            self.addButton.isEnabled = true
        }
        else {
            self.addButton.isEnabled = false
        }
    }
}
