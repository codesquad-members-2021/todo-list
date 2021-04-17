//
//  PopupViewController.swift
//  TodoListApp
//
//  Created by Song on 2021/04/13.
//

import UIKit

protocol PopupViewDelegate {
    func registerButtonPressed(title: String, notes: String)
}

class PopupViewController: UIViewController {
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    var delegate: PopupViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.layer.masksToBounds = true
        self.view.layer.cornerRadius = 6.0
        cancelButton.layer.masksToBounds = true
        cancelButton.layer.cornerRadius = 6.0
        registerButton.layer.masksToBounds = true
        registerButton.layer.cornerRadius = 6.0
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        delegate?.registerButtonPressed(title: titleTextField.text ?? "", notes: descriptionTextField.text ?? "")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
