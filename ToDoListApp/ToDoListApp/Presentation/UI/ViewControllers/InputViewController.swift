//
//  InputViewController.swift
//  ToDoListApp
//
//  Created by zombietux on 2021/04/10.
//

import UIKit

class InputViewController: UIViewController {

    @IBOutlet weak var enrollmentButton: UIButton!
    @IBOutlet var inputTextFields: [UITextField]!
    
    var mode: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: false, completion: .none)
    }
    
    @IBAction func enrollmentButtonTapped(_ sender: UIButton) {
    }
}
