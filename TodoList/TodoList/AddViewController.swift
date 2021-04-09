//
//  AddViewController.swift
//  TodoList
//
//  Created by HOONHA CHOI on 2021/04/09.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func encodeTask() {
    }

    @IBAction func registerButtonTouched(_ sender: UIButton) {
        
    }
    
    @IBAction func closeButtonTouched(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
