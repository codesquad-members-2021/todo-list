//
//  AddToDoViewController.swift
//  todo-list
//
//  Created by Song on 2021/04/08.
//

import UIKit

class AddToDoViewController: UIViewController {

    @IBOutlet weak var cardTitleLabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var completeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCornerRadius(for: cancelButton)
        setCornerRadius(for: completeButton)
    }

    private func setCornerRadius(for button: UIButton) {
        let radius = button.bounds.height * 0.1
        button.layer.cornerRadius = radius
    }
}
