//
//  AddTODOViewController.swift
//  TODOList
//
//  Created by Issac on 2021/04/08.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak private var subjectField: ObservingTextField!
    @IBOutlet weak private var bodyField: ObservingTextField!
    @IBOutlet weak private var writeButton: SubmitButton!
    @IBOutlet weak private var cardView: UIView!
    private var sectionMode: SectionMode?
    private var writeViewModel: ChangeCardViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.writeViewModel = ChangeCardViewModel()
        self.bind()
        self.addButtonCheckingTargets()
        self.subjectField.becomeFirstResponder()
    }
    
    private func bind() {
        self.subjectField.bind(to: writeViewModel.subject)
        self.bodyField.bind(to: writeViewModel.body)
    }
    
    private func addButtonCheckingTargets() {
        self.subjectField.addTarget(self, action: #selector(checkWriteButton), for: .editingChanged)
        self.bodyField.addTarget(self, action: #selector(checkWriteButton), for: .editingChanged)
    }
    
    @IBAction func touchCancelButton(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func touchSubmitButton(_ sender: UIButton) {
        guard let mode = sectionMode else { return }
        self.writeViewModel.addCard(mode: mode)
        dismiss(animated: false, completion: nil)
    }
    
    @objc func checkWriteButton() {
        if subjectField.text == "" || bodyField.text == "" {
            writeButton.isEnabled = false
        } else {
            writeButton.isEnabled = true
        }
    }
    
    func setSectionMode(mode: SectionMode) {
        self.sectionMode = mode
    }
}
