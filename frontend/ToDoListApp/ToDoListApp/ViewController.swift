//
//  ViewController.swift
//  ToDoListApp
//
//  Created by 이다훈 on 2021/04/06.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var toDoColumn: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let columnViewStoryboard = UIStoryboard.init(name: "ColumnView", bundle: nil)
        let columnVC = columnViewStoryboard.instantiateViewController(identifier: "ColumnView") as ColumnViewController
        columnVC.temptitle = "test"
        self.addChild(columnVC)
        toDoColumn.addSubview(columnVC.view!)
        }
    
//    override func viewDidAppear(_ animated: Bool) {
//
//    }
}
