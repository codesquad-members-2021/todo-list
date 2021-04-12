//
//  ModalViewController.swift
//  ToDoListApp
//
//  Created by user on 2021/04/08.
//

import UIKit

class ModalViewController: UIViewController {

    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var updateButton: UIButton!
    
    @IBOutlet weak var backgroundViewHeigthConstraint: NSLayoutConstraint!
    
    private var contentTextViewDelegate = ModalTextViewDelegate()
    private var sizeManager = SizeManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(changeSize), name: SizeManager.changeSize, object: sizeManager)
        
        setUpView()
        setUpButton()
        setUpDelegate()
        setUpViewSize()
    }
    
    func setUpView() {
        let cornerRadius: CGFloat = 5
        self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        self.backgroundView.layer.cornerRadius = cornerRadius
        
    }

    func setUpButton() {
        let cornerRadius: CGFloat = 5
        self.cancelButton.layer.cornerRadius = cornerRadius
        self.updateButton.layer.cornerRadius = cornerRadius
    }
    
    func setUpDelegate() {
        self.contentTextView.delegate = contentTextViewDelegate
    }
    
    func setUpViewSize() {
        let contentTextViewHeight = contentTextView.sizeThatFits(contentTextView.contentSize).height
        self.sizeManager.setInitialHeight(viewHeight: backgroundViewHeigthConstraint.constant, contentTextViewHeight: contentTextViewHeight)
        
        self.contentTextViewDelegate.configureHeight { height in
            self.sizeManager.changeHeight(height)
        }
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @objc func changeSize(notification: Notification) {
        guard let backgroundViewHeight = notification.userInfo?[SizeManager.Size.backgroundViewHeight] as? CGFloat
        else {
            return
        }
        
        self.backgroundViewHeigthConstraint.constant = backgroundViewHeight
    }
    
}
