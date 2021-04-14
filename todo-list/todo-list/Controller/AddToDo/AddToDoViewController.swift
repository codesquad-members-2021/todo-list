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
    
    private let cardAdder: CardAddable?
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, cardAdder: CardAddable) {
        self.cardAdder = cardAdder
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        self.cardAdder = nil
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCornerRadius(for: cancelButton)
        setCornerRadius(for: completeButton)
    }
    
    private func setCornerRadius(for button: UIButton) {
        let radius = button.bounds.height * 0.1
        button.layer.cornerRadius = radius
    }
    
    //MARK: - Button Actions
    @IBAction func addButtonTouched(_ sender: Any) {
        guard let cardAdder = self.cardAdder,
              let title = titleTextField.text,
              let contents = contentTextField.text,
              let newCard = cardAdder.newCard(withTitle: title, contents: contents) else { return }
        
        cardAdder.add(card: newCard)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonTouched(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
