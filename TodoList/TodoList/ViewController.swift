//
//  ViewController.swift
//  TodoList
//
//  Created by HOONHA CHOI on 2021/04/06.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var activityView: UIView!
    @IBOutlet weak var activityTrailingConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityTrailingConstraint.constant -= activityView.frame.width
    }

    @IBAction func touchUpAdd(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "Add") as? AddViewController else {
            return
        }
        vc.status = .add
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func touchUpMenu(_ sender: Any) {
        activityTrailingConstraint.constant = 0
        UIView.animate(withDuration: 0.4) { [weak self] in
            self?.view.layoutIfNeeded()
        }
    }
    
    @IBAction func touchUpClose(_ sender: Any) {
        activityTrailingConstraint.constant -= activityView.frame.width
        UIView.animate(withDuration: 0.4) { [weak self] in
            self?.view.layoutIfNeeded()
        }
    }
    
}

