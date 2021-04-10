//
//  ModalView.swift
//  ToDoListApp
//
//  Created by 박정하 on 2021/04/10.
//

import UIKit

class ModalView : UIViewController {
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var CancelButton: UIButton!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addCard(_ sender: Any) {
        
    }
    
    @IBAction func inActiveNewCardForm(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
