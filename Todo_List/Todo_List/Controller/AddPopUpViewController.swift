//
//  AddModalViewController.swift
//  Todo_List
//
//  Created by 박혜원 on 2021/04/08.
//

import UIKit

class AddPopUpViewController: UIViewController {
    
    
    @IBOutlet var taskTitle: UITextField!
    @IBOutlet weak var taskContent: UITextField!
    
    var completionHandler : ((TaskVO) -> ())? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    @IBAction func cancel(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func enroll(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion : nil)
        
        guard let title = taskTitle.text,
              let content = taskContent.text
        else { return }
        
        let new = TaskVO(title: title, content: content, writer: "elly")
        self.completionHandler?(new)
    }
    func setHandler(handler : @escaping (TaskVO) -> ()) {
        self.completionHandler = handler
    }
    func configure(){
        view.backgroundColor = .white
        self.preferredContentSize = CGSize(width: 400, height: 175)
    }
}
