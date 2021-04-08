//
//  AddTODOViewController.swift
//  TODOList
//
//  Created by Issac on 2021/04/08.
//

import UIKit

class AddTODOViewController: UIViewController, UITextFieldDelegate {
    private var sectionMode: Mode?
    @IBOutlet weak var subjectField: UITextField!
    @IBOutlet weak var bodyField: UITextField!
    @IBOutlet weak var writeButton: UIButton!
    @IBOutlet weak var cardView: UIView!
    var centerConstraint: NSLayoutConstraint!
    var topConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setDisabledButtonStyle()
        
        self.subjectField.becomeFirstResponder()
    }
    
    private func addButtonCheckingTargets() {
        self.subjectField.addTarget(self, action: #selector(checkWriteButton), for: .editingChanged)
        self.bodyField.addTarget(self, action: #selector(checkWriteButton), for: .editingChanged)
    }
    
    @IBAction func touchCancelButton(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }
    
    private func setDisabledButtonStyle() {
        let disabledColor = UIColor(displayP3Red: 134/255, green: 198/255, blue: 255/255, alpha: 1)
        self.writeButton.setBackgroundColor(disabledColor, for: .disabled)
    }
    
    @objc func checkWriteButton() {
        if subjectField.text == "" || bodyField.text == "" {
            writeButton.isEnabled = false
        } else {
            writeButton.isEnabled = true
        }
    }
    
    func setSectionMode(mode: Mode) {
        self.sectionMode = mode
    }
}

extension UIButton {
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setFillColor(color.cgColor)
        context.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let backgroundImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.setBackgroundImage(backgroundImage, for: state)
    }
}
