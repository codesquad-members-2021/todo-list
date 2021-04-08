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
    
    let url = "https://fc14a707-47df-4e09-9fb0-84045a2d8469.mock.pstmn.io/todos"

    override func viewDidLoad() {
        super.viewDidLoad()
//        DataManager.getData(urlString: url) { (string) in
//        }

       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segue.todo {
            let destVC = segue.destination as! ToDoViewController
            destVC.view.backgroundColor = .blue
        } else if segue.identifier == Segue.doing {
            let destVC = segue.destination as! DoingViewController
            destVC.view.backgroundColor = .green
        } else if segue.identifier == Segue.done {
            let destVC = segue.destination as! DoneViewController
            destVC.view.backgroundColor = .red
        }
    }
}
