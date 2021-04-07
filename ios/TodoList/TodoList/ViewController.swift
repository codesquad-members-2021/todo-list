//
//  ViewController.swift
//  TodoList
//
//  Created by Jun Ho JANG on 2021/04/06.
//

import UIKit

class ViewController: UIViewController {

    let url = "https://jsonplaceholder.typicode.com/todos/1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataManager.getData(urlString: url) { (string) in
        }
    }

}
