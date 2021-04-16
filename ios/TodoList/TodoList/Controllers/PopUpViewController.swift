//
//  PopUpViewController.swift
//  TodoList
//
//  Created by 조중윤 on 2021/04/14.
//

import UIKit

protocol AbilityToFetchData {
    func fetchData()
}

class PopUpViewController: UIViewController {
    var abilityToFetchData: AbilityToFetchData?
    
    var promptMessage: String = ""
    var status: String = ""
    
    @IBOutlet weak var promptView: UIView!
    @IBOutlet weak var promptLabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentsTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        promptView.backgroundColor = .white
        promptLabel.text = promptMessage
        titleTextField.text = ""
        contentsTextField.text = ""
        self.promptView.layer.cornerRadius = 40
        self.promptView.layer.masksToBounds = true
    }
    
    func setPromptMessage(message: String) {
        self.promptMessage = message
    }
    
    func setStatus(status: String) {
        self.status = status
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func confirmButton(_ sender: UIButton) {
        let dataToSend = ["title": titleTextField.text!, "contents": contentsTextField.text!, "status": self.status]
        APIRequestManager.requestPost(url: Constants.url, parameter: dataToSend) { (true, responseJSON) in
            print("will send delegate")
            self.abilityToFetchData?.fetchData()
        }
    }
}

//FIXME: Fetch data 위치 고치기
