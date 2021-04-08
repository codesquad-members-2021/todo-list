//
//  AddTODOViewController.swift
//  TODOList
//
//  Created by Issac on 2021/04/08.
//

import UIKit

class AddTODOViewController: UIViewController, UITextFieldDelegate {
    private var sectionMode: Mode?
    @IBOutlet weak var subjectField: ObservingTextField!
    @IBOutlet weak var bodyField: ObservingTextField!
    @IBOutlet weak var writeButton: SubmitButton!
    @IBOutlet weak var cardView: UIView!
    var centerConstraint: NSLayoutConstraint!
    var topConstraint: NSLayoutConstraint!
    
    var importViewModel: ImportViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.importViewModel = ImportViewModel(subject: TextObservable(value: ""),
                                               body: TextObservable(value: ""))
        
        self.subjectField.bind(to: importViewModel.subject)
        self.bodyField.bind(to: importViewModel.body)
        
        self.addButtonCheckingTargets()
        
        self.subjectField.becomeFirstResponder()
    }
    
    private func addButtonCheckingTargets() {
        self.subjectField.addTarget(self, action: #selector(checkWriteButton), for: .editingChanged)
        self.bodyField.addTarget(self, action: #selector(checkWriteButton), for: .editingChanged)
    }
    
    @IBAction func touchCancelButton(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func touchSubmitButton(_ sender: UIButton) {
        self.importViewModel.trigger()
        dismiss(animated: false, completion: nil)
    }
    
    @objc func checkWriteButton() {
        if subjectField.text == "" || bodyField.text == "" {
            writeButton.isEnabled = false
        } else {
            writeButton.isEnabled = true
        }
    }
    
    func setSectionMode(mode: Mode) {
        self.sectionMode = mode
    }
}
