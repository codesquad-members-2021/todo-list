//
//  PopUpViewController.swift
//  TodoList
//
//  Created by 조중윤 on 2021/04/14.
//

import UIKit

class PopUpViewController: UIViewController {
    @IBOutlet weak var promptView: UIView!
    @IBOutlet weak var promptLabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentsTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        promptView.backgroundColor = .red
        titleTextField.text = ""
        contentsTextField.text = ""

    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
    }
    
    @IBAction func confirmButton(_ sender: UIButton) {
        print("\(titleTextField.text!)\n\(contentsTextField.text!)")
    }
    
    //    @objc func handleDismissal() {
//
//    }
}
