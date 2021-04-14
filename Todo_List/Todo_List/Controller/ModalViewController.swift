//
//  AddModalViewController.swift
//  Todo_List
//
//  Created by 박혜원 on 2021/04/08.
//

import UIKit

class ModalViewController: UIViewController {
    
    @IBOutlet var cardTitle: UITextField!
    @IBOutlet weak var cardContent: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var enrollButton: UIButton!
    
    var completionHandler : ((Card) -> ())? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cardTitle.delegate = self
        self.cardContent.delegate = self
        configure()
    }
    @IBAction func cancel(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func enroll(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion : nil)
        
        guard let title = cardTitle.text,
              let content = cardContent.text
        else { return }
        
        let new = Card(title: title, content: content, writer: "elly")
        self.completionHandler?(new)
    }
    func setHandler(handler : @escaping (Card) -> ()) {
        self.completionHandler = handler
    }
    func configure(){
    
        view.backgroundColor = .white
        self.preferredContentSize = CGSize(width: 400, height: 175)
        
        self.cancelButton.backgroundColor = UIColor.init(named: "gray5")
        self.cancelButton.layer.cornerRadius = 6
        
        self.enrollButton.backgroundColor = UIColor.init(named: "lightBlue")
        self.enrollButton.layer.cornerRadius = 6
        self.enrollButton.isEnabled = false
    }
}
extension ModalViewController : UITextFieldDelegate {
    func isEmpty() -> Bool {
        guard let title = cardTitle.text,
              let content = cardTitle.text
        else {
            return true
        }
        if title.isEmpty || content.isEmpty {
            return true
        }
        return false
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if !isEmpty() {
            enrollButton.isEnabled = true
            enrollButton.backgroundColor = UIColor(named: "blue")
        }
    }
}
