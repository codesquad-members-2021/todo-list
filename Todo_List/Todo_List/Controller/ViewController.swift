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
    
    private var todoCards = TodoCards() // ⚠️
    private var networkManager = NetworkManager()
    
    
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
        NetworkHandler.get(urlString: EndPoint.home.rawValue, dataType: TodoCards.self)
        setObserver()
        setting()
        super.viewDidLoad()
    }
    
    
    // MARK:- Method
    
    private func setting() {
        setVC(self.todoViewController, data: self.todoCards.todo, name: .todo, column: "todo")
        setVC(self.doingViewController, data: self.todoCards.doing, name: .doing, column: "doing")
        setVC(self.doneViewController, data: self.todoCards.done, name: .done, column: "done")
    }
    
    private func setVC(_ viewController: TodoTableViewController?, data: [TodoCard], name: Column, column: String) {
        viewController?.getData(with: data, column: column)
        viewController?.setting()
        viewController?.setHeader(columnName: name.rawValue)
    }
    
    
    //MARK:- Notification
    
    private func setObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(reloadData), name: NSNotification.Name(rawValue: "finishNetwork"), object: nil)
    }
    
    @objc func reloadData(_ notification: Notification) {
        
        guard let dict = notification.userInfo as Dictionary? else { return }
        if let cards = dict["cards"] as? TodoCards {
            self.todoCards = cards
            setting()
        }
    }
}



