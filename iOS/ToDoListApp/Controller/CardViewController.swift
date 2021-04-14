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
    private var inProgressViewDataSource = ToDoTableViewDataSource(identifier: .InProgress)
    private var doneViewDataSource = ToDoTableViewDataSource(identifier: .Done)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(changeBadge), name: CardManager.changeCardCount, object: cardManager)
        
        configureDelegate()
        configureBadge()
    }
    
    func configureDelegate() {
        toDoTableView.delegate = tableViewDelegate
        toDoTableView.dataSource = toDoTableViewDataSource
        
        inProgressTableView.delegate = tableViewDelegate
        inProgressTableView.dataSource = inProgressViewDataSource
        
        doneTableView.delegate = tableViewDelegate
        doneTableView.dataSource = doneViewDataSource
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
        self.todoBadge.label.text = "\(cardManager.count(states: .ToDo))"
        self.inProgressBadge.label.text  = "\(cardManager.count(states: .InProgress))"
        self.doneBadge.label.text  = "\(cardManager.count(states: .Done))"
    }
}
