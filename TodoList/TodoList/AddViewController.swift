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
    
    func encodeTask() -> Data? {
        guard let title = titleTextField.text, let content = contentTextField.text else {
            return nil
        }
        return Task(title: title, contents: content, category: TaskState.todo).encode()
    }

    @IBAction func registerButtonTouched(_ sender: UIButton) {
        guard let data = encodeTask() else {
            return
        }
        DoingUseCase().postTask(body: data) { (result) in
        }
    }
    
    @IBAction func closeButtonTouched(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
