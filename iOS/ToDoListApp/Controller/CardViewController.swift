//
//  CardViewController.swift
//  ToDoListApp
//
//  Created by user on 2021/04/08.
//

import UIKit

class CardViewController: UIViewController ,CardDelegate {

    @IBOutlet weak var toDoTableView: UITableView!
    @IBOutlet weak var inProgressTableView: UITableView!
    @IBOutlet weak var doneTableView: UITableView!
    
    @IBOutlet weak var todoBadge: BadgeView!
    @IBOutlet weak var inProgressBadge: BadgeView!
    @IBOutlet weak var doneBadge: BadgeView!
    
    private var cardManager = CardManager.shared
    
    private var tableViewDelegate = ToDoTableViewDelegate()
    
    private var toDoTableViewDataSource = ToDoTableViewDataSource(identifier: .ToDo)
    private var toDoTableViewDragDropDelegate = ToDoTableViewDragDropDelegate(identifier: .ToDo)
    
    private var inProgressViewDataSource = ToDoTableViewDataSource(identifier: .InProgress)
    private var inProgressViewDragDropDelegate = ToDoTableViewDragDropDelegate(identifier: .InProgress)
    
    private var doneViewDataSource = ToDoTableViewDataSource(identifier: .Done)
    private var doneViewDragDropDelegate = ToDoTableViewDragDropDelegate(identifier: .Done)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureNotification()
        configureDelegate()
        configureBadge()
    }
    
    func configureNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(changeBadge), name: CardManager.changeCardCount, object: cardManager)
        NotificationCenter.default.addObserver(self, selector: #selector(cardMove), name: CardManager.cardMove, object: cardManager)
    }
    
    func configureDelegate() {
        toDoTableView.delegate = tableViewDelegate
        toDoTableView.dataSource = toDoTableViewDataSource
        toDoTableView.dragDelegate = toDoTableViewDragDropDelegate
        toDoTableView.dropDelegate = toDoTableViewDragDropDelegate
        toDoTableView.dragInteractionEnabled = true
        
        inProgressTableView.delegate = tableViewDelegate
        inProgressTableView.dataSource = inProgressViewDataSource
        inProgressTableView.dragDelegate = inProgressViewDragDropDelegate
        inProgressTableView.dropDelegate = inProgressViewDragDropDelegate
        inProgressTableView.dragInteractionEnabled = true
        
        doneTableView.delegate = tableViewDelegate
        doneTableView.dataSource = doneViewDataSource
        doneTableView.dragDelegate = doneViewDragDropDelegate
        doneTableView.dropDelegate = doneViewDragDropDelegate
        doneTableView.dragInteractionEnabled = true
    }

    func configureBadge() {
        self.todoBadge.label.text  = "\(cardManager.count(states: .ToDo))"
        self.inProgressBadge.label.text  = "\(cardManager.count(states: .InProgress))"
        self.doneBadge.label.text  = "\(cardManager.count(states: .Done))"
    }
    
    func cardData(_ card: Card) {
        self.cardManager.add(card: card)
        self.toDoTableView.reloadData()
        self.inProgressTableView.reloadData()
        self.doneTableView.reloadData()
    }
    
    //MARK: IBAction 처리
    @IBAction func addToDoCardButtonPressed(_ sender: UIButton) {
        guard let modalViewController = self.storyboard?.instantiateViewController(identifier: "modalViewController") as? ModalViewController
        else {
            return
        }
        
        modalViewController.setUpCardDelegate(state: .ToDo, delegate: self)
        self.present(modalViewController, animated: true, completion: nil)
    }
    
    @IBAction func addInProgressButtonPressed(_ sender: UIButton) {
        guard let modalViewController = self.storyboard?.instantiateViewController(identifier: "modalViewController") as? ModalViewController
        else {
            return
        }
        
        modalViewController.setUpCardDelegate(state: .InProgress, delegate: self)
        self.present(modalViewController, animated: true, completion: nil)
    }
    
    @IBAction func addDoneButtonPressed(_ sender: UIButton) {
        guard let modalViewController = self.storyboard?.instantiateViewController(identifier: "modalViewController") as? ModalViewController
        else {
            return
        }
        
        modalViewController.setUpCardDelegate(state: .Done, delegate: self)
        self.present(modalViewController, animated: true, completion: nil)
    }
    
    //MARK: objc 처리
    @objc func changeBadge(notification: Notification) {
        guard let states = notification.userInfo?[NotificationUserInfoKey.sourceStates] as? States else { return }
        
        switch states {
        case .ToDo:
            self.todoBadge.label.text = "\(cardManager.count(states: .ToDo))"
        case .InProgress:
            self.inProgressBadge.label.text  = "\(cardManager.count(states: .InProgress))"
        case .Done:
            self.doneBadge.label.text  = "\(cardManager.count(states: .Done))"
        }
    }
    
    @objc func cardMove(notification: Notification) {
        guard let states = notification.userInfo?[NotificationUserInfoKey.sourceStates] as? States else { return }
        
        switch states {
        case .ToDo:
            toDoTableView.reloadData()
        case .InProgress:
            inProgressTableView.reloadData()
        case .Done:
            doneTableView.reloadData()
        }
         
    }
}
