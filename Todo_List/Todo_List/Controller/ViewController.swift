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
    
    private var todoCards = TodoCards()
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
        setObserver()
        NetworkManager().getSource(urlString: EndPoint.home.rawValue,
                                   httpMethod: .get,
                                   dataType: TodoCards.self) { (cards, error) in
            self.todoCards = cards as! TodoCards
            self.setting()
        }
        super.viewDidLoad()
    }
    
    
    // MARK:- Method
    
    private func setting() {
        setVC(self.todoViewController, data: self.todoCards.todo, name: .todo, column: "todo")
        setVC(self.doingViewController, data: self.todoCards.doing, name: .doing, column: "doing")
        setVC(self.doneViewController, data: self.todoCards.done, name: .done, column: "done")
    }
    
    private func setVC(_ viewController: TodoTableViewController?, data: [TodoCard], name: Column, column: String) {
        viewController?.setData(with: data, column: column)
        viewController?.setting()
        viewController?.setHeader(columnName: name.rawValue)
        viewController?.reload()
    }
    
    
    //MARK:- Notification
    
    private func setObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(reloadData), name: .finishNetwork, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(moveCard), name: .moveCard, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(removeCard), name: .removeCard, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(completeCard), name: .completeCard, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(modifyCard), name: .modifyCard, object: nil)
    }
    
    @objc func reloadData(_ notification: Notification) {
        NetworkManager().getSource(urlString: EndPoint.home.rawValue,
                                   httpMethod: .get,
                                   dataType: TodoCards.self) { (cards, error) in
            self.todoCards = cards as! TodoCards
            self.setting()
        }
    }
    
    @objc func moveCard(_ notification: Notification) {
        guard let dict = notification.userInfo as Dictionary? else { return }
        guard let card = dict["card"] as? TodoCard else { return }
        guard let status = dict["column"] as? String else { return }

        let moveCard = MoveCard(status: status)
        let url = "\(EndPoint.modify.rawValue)/\(card.id)/status"
        
        NetworkHandler.post(anydata: moveCard, url: url, httpMethod: .put)
    }
    
    @objc func removeCard(_ notification: Notification) {
        guard let dict = notification.userInfo as Dictionary? else { return }
        guard let cardNum = dict["cardNum"] as? Int else { return }

        let url = "\(EndPoint.modify.rawValue)/\(cardNum)"
        
        NetworkHandler.post(anydata: cardNum, url: url, httpMethod: .delete)
    }
    
    @objc func completeCard(_ notification: Notification) {
        guard let dict = notification.userInfo as Dictionary? else { return }
        guard let cardNum = dict["cardNum"] as? Int else { return }
        
        let moveCard = MoveCard(status: "done")
        let url = "\(EndPoint.modify.rawValue)/\(cardNum)/status"
        
        NetworkHandler.post(anydata: moveCard, url: url, httpMethod: .put)
    }
    
    @objc func modifyCard(_ notification: Notification) {
        guard let dict = notification.userInfo as Dictionary? else { return }
        guard let cardNum = dict["cardNum"] as? Int else { return }
        
        let modalView = ModalViewController(nibName: "ModalViewController", bundle: nil, mode: .modify, status: nil, cardId: cardNum)
        modalView.modalPresentationStyle = .custom
        self.present(modalView, animated: true, completion: nil)  
    }
}
