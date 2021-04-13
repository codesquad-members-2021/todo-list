//
//  ViewController.swift
//  Todo_List
//
//  Created by 심영민 on 2021/04/06.
//

import UIKit

protocol EditViewControllerDelegate {
    func addCard(type: DoType, with card: TodoCard)
}

class ViewController: UIViewController {
    
    enum Column: String {
        case todo = "해야할 일"
        case doing = "하고 있는 일"
        case done = "완료한 일"
    }
    
    private var todoViewController: TodoTableViewController?
    private var doingViewController: TodoTableViewController?
    private var doneViewController: TodoTableViewController?
    
    private var cardManager: CardManageable!
    
    
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
        self.cardManager = CardManager()
        setting()
        super.viewDidLoad()
    }
    
    
    // MARK:- Method
    
    private func setting() {
        setVC(self.todoViewController, data: self.cardManager.getCards(type: .todo), name: .todo)
        setVC(self.doingViewController, data: self.cardManager.getCards(type: .doing), name: .doing)
        setVC(self.doneViewController, data: self.cardManager.getCards(type: .done), name: .done)
        setObserver()
    }
    
    private func setVC(_ viewController: TodoTableViewController?, data: TodoCardsManageable, name: Column) {
        viewController?.getData(with: data)
        viewController?.setting()
        viewController?.setHeader(columnName: name.rawValue)
    }
    
    func setObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(reloadData), name: NSNotification.Name(rawValue: "addCard"), object: nil)
    }
    
    @objc func reloadData(_ notification: Notification) {
        print("reloadData")
        self.todoViewController?.reloadData()
    }
    
    
}
