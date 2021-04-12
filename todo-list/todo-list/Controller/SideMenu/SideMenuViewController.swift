//
//  SideMenuViewController.swift
//  todo-list
//
//  Created by Song on 2021/04/08.
//

import UIKit

class SideMenuViewController: UIViewController {
    
    private var customTransitionDelegate: UIViewControllerTransitioningDelegate
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.customTransitionDelegate = SideMenuTransitionDelegate()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        modalPresentationStyle = .custom
        transitioningDelegate = customTransitionDelegate
    }
    
    required init?(coder: NSCoder) {
        self.customTransitionDelegate = SideMenuTransitionDelegate()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closeButtonTouched(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
