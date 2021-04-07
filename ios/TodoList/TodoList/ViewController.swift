//
//  ViewController.swift
//  TodoList
//
//  Created by Jun Ho JANG on 2021/04/06.
//

import UIKit

class ViewController: UIViewController {

    let url = "https://fc14a707-47df-4e09-9fb0-84045a2d8469.mock.pstmn.io/todos"

    override func viewDidLoad() {
        super.viewDidLoad()
        DataManager.getData(urlString: url) { (string) in
        }
    }
}
