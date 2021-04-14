//
//  AddViewController.swift
//  TodoList
//
//  Created by HOONHA CHOI on 2021/04/09.
//

import UIKit

enum CardStatus {
    case add
    case update
}

class AddViewController: UIViewController {
    @IBOutlet weak var cardTitle: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextField: UITextField!
    @IBOutlet weak var positiveButton: CardButton!
    @IBOutlet weak var popUp: UIView!
    
    var status: CardStatus?
    var titleName: String?
    var contents: String?
    private var isKeyboardActive: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switch status {
        case .update:
            setUpdateUI()
        default:
            break
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(adjustPopUp), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(adjustPopUpDown), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func adjustPopUp(noti: Notification) {
        if isKeyboardActive != true {
            guard let userInfo = noti.userInfo else { return }
            guard let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
            popUp.frame.origin.y -= keyboardFrame.height / 3
            isKeyboardActive = true
        }
    }
    
    @objc func adjustPopUpDown(noti: Notification) {
        guard let userInfo = noti.userInfo else { return }
        guard let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        popUp.frame.origin.y += keyboardFrame.height / 3
    }
    
    func encodeTask() -> Data? {
        guard let title = titleTextField.text, let content = contentTextField.text else {
            return nil
        }
        return Task(title: title, contents: content, category: TaskState.todo).encode()
    }

    func setUpdateUI() {
        cardTitle.text = "카드 수정"
        positiveButton.setTitle("수정", for: .normal)
        titleTextField.text = titleName
        contentTextField.text = contents
    }
    
    @IBAction func registerButtonTouched(_ sender: UIButton) {
        guard let data = encodeTask() else {
            return
        }
        UseCase().postTask(body: data) { (result) in
        }
    }
    
    @IBAction func closeButtonTouched(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tap(_ sender: Any) {
        titleTextField.resignFirstResponder()
        contentTextField.resignFirstResponder()
    }
}
