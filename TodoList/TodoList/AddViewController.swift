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
    
    var status: CardStatus?
    var titleName: String?
    var contents: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switch status {
        case .update:
            setUpdateUI()
        default:
            break
        }
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
        DoingUseCase().postTask(body: data) { (result) in
        }
    }
    
    @IBAction func closeButtonTouched(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
