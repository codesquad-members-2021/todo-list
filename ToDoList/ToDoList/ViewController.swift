//
//  ViewController.swift
//  ToDoList
//
//  Created by 오킹 on 2021/04/06.
//

import UIKit
import Combine

class ViewController: UIViewController {

    let useCase = UseCase()

    override func viewDidLoad() {
        useCase.showCards()
    }
}

