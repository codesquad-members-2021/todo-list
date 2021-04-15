//
//  ViewController.swift
//  Todo_List
//
//  Created by 심영민 on 2021/04/06.
//

import UIKit


class ViewController: UIViewController {
    
    enum Column: String {
        case todo = "해야할 일"
        case doing = "하고 있는 일"
        case done = "완료한 일"
    }
    
    private var todoViewController: TodoTableViewController?
    private var doingViewController: TodoTableViewController?
    private var doneViewController: TodoTableViewController?
    
    private var TodoCards: TodoCards! // ⚠️
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "todo":
            todoViewController = segue.destination as? TodoTableViewController
        case "doing":
            doingViewController = segue.destination as? TodoTableViewController
        case "done":
            doneViewController = segue.destination as? TodoTableViewController
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        setting()
        super.viewDidLoad()
    }
    
    
    // MARK:- Method
    
    private func setting() {
        setVC(self.todoViewController, data: self.TodoCards.todo, name: .todo)
        setVC(self.doingViewController, data: self.TodoCards.doing, name: .doing)
        setVC(self.doneViewController, data: self.TodoCards.done, name: .done)
    }
    
    private func setVC(_ viewController: TodoTableViewController?, data: [TodoCard], name: Column) {
        viewController?.getData(with: data)
        viewController?.setting()
        viewController?.setHeader(columnName: name.rawValue)
    }
    
    // noti
    // noti.observer
    // 이 시점에서 데이터를 받아서
    // self.TodoCard = Network 처리
    //
}
