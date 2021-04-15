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
    @IBOutlet weak var completeButton: CompleteButton!
    
    private var titleTextFieldDelegate: AddToDoTextFieldDelegate?
    private var contentTextFieldDelegate: AddToDoTextFieldDelegate?
    
    private let cardAdder: CardAddable?
    private let validators: [String: InputValidable] = ["title": TitleValidator(), "content": ContentsValidator()]
    
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
        setTextFieldDelegates()
        configureObservers()
    }
    
    //MARK: - Settings
    private func setTextFieldDelegates() {
        titleTextFieldDelegate = AddToDoTextFieldDelegate(validator: validators["title"]!)
        contentTextFieldDelegate = AddToDoTextFieldDelegate(validator: validators["content"]!)
        
        titleTextField.delegate = titleTextFieldDelegate
        contentTextField.delegate = contentTextFieldDelegate
    }
    
    private func configureObservers() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateButtonState(_:)),
                                               name: AddToDoTextFieldDelegate.NotiKeys.validateDone,
                                               object: nil)
    }
    
    @objc private func updateButtonState(_ notification: Notification) {
        let totalCount = validators.count
        let validateCount = validators.values.compactMap{ $0.validatedText() }.count
        totalCount == validateCount ? completeButton.enable() : completeButton.disable()
    }
    
    //MARK: - Button Actions
    @IBAction func addButtonTouched(_ sender: Any) {
        guard let cardAdder = self.cardAdder,
              let title = titleTextField.text,
              let contents = contentTextField.text else { return }
        cardAdder.newCard(withTitle: title, contents: contents)
    
        //newCard를 main으로 노티 보내서 네트워크에 올리는 동작 필요
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonTouched(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
