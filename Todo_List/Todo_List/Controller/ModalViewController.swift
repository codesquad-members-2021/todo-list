//
//  AddModalViewController.swift
//  Todo_List
//
//  Created by 박혜원 on 2021/04/08.
//

import UIKit

class ModalViewController: UIViewController {
    
    
    @IBOutlet var cardTitle: UITextField!
    @IBOutlet weak var cardContent: UITextField!
    
    var completionHandler : ((Card) -> ())? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    @IBAction func cancel(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func enroll(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion : nil)
        
        guard let title = cardTitle.text,
              let content = cardContent.text
        else { return }
        
        let new = Card(title: title, content: content, writer: "elly")
        self.completionHandler?(new)
    }
    func setHandler(handler : @escaping (Card) -> ()) {
        self.completionHandler = handler
    }
    func configure(){
        view.backgroundColor = .white
        self.preferredContentSize = CGSize(width: 400, height: 175)
    }
}
