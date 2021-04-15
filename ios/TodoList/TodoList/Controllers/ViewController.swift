//
//  ViewController.swift
//  TodoList
//
//  Created by Jun Ho JANG on 2021/04/06.
//

import UIKit

enum Segue {
    static let todo = "toToDoViewController"
    static let doing = "toDoingViewController"
    static let done = "toDoneViewController"
}

class ViewController: UIViewController {
    @IBOutlet weak var firstContainver: UIView!
    @IBOutlet weak var secondContainer: UIView!
    @IBOutlet weak var thirdContainer: UIView!
    
    private var sideMenuViewController: SideMenuViewController!
    
    @IBOutlet weak var sideMenuTrailingConstraint: NSLayoutConstraint!
    
    @IBAction func sideMenuButtonAction(_ sender: Any) {
        sideMenuViewController.isSideMenuOpen = true
        
    }
    
    @objc func sideMenuButtonToggle(notification: Notification) {
        let getValue = notification.object as! Bool
        if getValue == true {
            sideMenuTrailingConstraint.constant = 21
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        } else {
            sideMenuTrailingConstraint.constant = -261
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSideMenu()
        NotificationCenter.default.addObserver(self, selector: #selector(sideMenuButtonToggle), name: .didChangeSideMenuToggle, object: nil)
    }
    
    func configureSideMenu() {
        sideMenuViewController = SideMenuViewController()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == Segue.todo {
//            let destVC = segue.destination as! ToDoViewController
//        } else if segue.identifier == Segue.doing {
//            let destVC = segue.destination as! DoingViewController
//        } else if segue.identifier == Segue.done {
//            let destVC = segue.destination as! DoneViewController
//        }
    }
}
