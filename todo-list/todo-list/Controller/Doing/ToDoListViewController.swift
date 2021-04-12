//
//  ViewController.swift
//  todo-list
//
//  Created by sonjuhyeong on 2021/04/06.
//

import UIKit

class ToDoListViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func sideMenuButtonTouched(_ sender: Any) {
        let sideMenuVC = SideMenuViewController(nibName: "SideMenuViewController", bundle: .none)
        self.present(sideMenuVC, animated: true, completion: nil)
    }
    
}

