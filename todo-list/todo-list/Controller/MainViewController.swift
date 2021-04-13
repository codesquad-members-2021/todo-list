//
//  ViewController.swift
//  todo-list
//
//  Created by sonjuhyeong on 2021/04/06.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func sideMenuButtonTouched(_ sender: Any) {
        let sideMenuVC = SideMenuViewController(nibName: "SideMenuViewController", bundle: .none)
        self.present(sideMenuVC, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIdentifier.WillDo.rawValue, let toDoViewController = segue.destination as? ToDoViewController {
            toDoViewController.segueInfo = SegueIdentifier.WillDo.rawValue
        } else if segue.identifier == SegueIdentifier.Doing.rawValue, let toDoViewController = segue.destination as? ToDoViewController {
            toDoViewController.segueInfo = SegueIdentifier.Doing.rawValue
        } else if segue.identifier == SegueIdentifier.Done.rawValue, let toDoViewController = segue.destination as? ToDoViewController {
            toDoViewController.segueInfo = SegueIdentifier.Done.rawValue
        }
    }
}

enum SegueIdentifier: String {
    case WillDo = "WillDo"
    case Doing = "Doing"
    case Done = "Done"
}
