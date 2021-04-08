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
        setVC(self.todoViewController, data: TodoCards(), name: .todo)
        setVC(self.doingViewController, data: doingCards, name: .doing)
        setVC(self.doneViewController, data: doneCards, name: .done)
    }
    
    private func setVC(_ viewController: TodoTableViewController?, data: TodoCardsManageable, name: Column) {
        viewController?.getData(with: data)
        viewController?.setting()
        viewController?.setHeader(columnName: name.rawValue)
    }
    
}


// MARK:- test variable

let doingCards = TodoCards(cards: [TodoCard(title: "doing", content: "~~dd"), TodoCard(), TodoCard(title: "3rd", content: "something blabla")])
let doneCards = TodoCards(cards: [TodoCard(title: "done", content: "아무말을 써보겠음"), TodoCard(), TodoCard(title: "제목임", content: "본 내용은 다음과 같습니다. \n아무 말"), TodoCard(title: "아아e", content: "후우..")])
