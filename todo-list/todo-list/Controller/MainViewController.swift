//
//  ViewController.swift
//  todo-list
//
//  Created by sonjuhyeong on 2021/04/06.
//

import UIKit

class MainViewController: UIViewController {
    
    private let willDoCardManager = CardManager()
    private let doingCardManager = CardManager()
    private let doneCardManager = CardManager()
    
    private let taskManager = TaskManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadCard()
        NotificationCenter.default.addObserver(self, selector: #selector(postCard), name: CardManager.NotiKeys.addCard, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(deleteCard), name: CardManager.NotiKeys.deleteCard, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(moveCard), name: CardManager.NotiKeys.moveCard, object: nil)
    
    }

    @IBAction func sideMenuButtonTouched(_ sender: Any) {
        let sideMenuVC = SideMenuViewController(nibName: "SideMenuViewController", bundle: .none, taskList: taskManager)
        self.present(sideMenuVC, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let toDoViewController = segue.destination as? ToDoViewController else { return }
        
        if segue.identifier == SegueIdentifier.WillDo.rawValue  {
            toDoViewController.cardManager = willDoCardManager
            toDoViewController.tableTitle = Category.WillDo.rawValue
        } else if segue.identifier == SegueIdentifier.Doing.rawValue {
            toDoViewController.cardManager = doingCardManager
            toDoViewController.tableTitle = Category.Doing.rawValue
        } else if segue.identifier == SegueIdentifier.Done.rawValue {
            toDoViewController.cardManager = doneCardManager
            toDoViewController.tableTitle = Category.Done.rawValue
        }
    }
    
    private func loadCard() {
        DataTaskManager.get(completion: { (result) in
            DispatchQueue.global().async {
                switch result {
                case .success(let data):
                    self.willDoCardManager.configure(cardList: data.data[0].cards, categoryID: data.data[0].categoryId)
                    self.doingCardManager.configure(cardList: data.data[1].cards, categoryID: data.data[1].categoryId)
                    self.doneCardManager.configure(cardList: data.data[2].cards, categoryID: data.data[2].categoryId)
                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
        })
    }
    
    @objc private func postCard(_ notification: Notification) {
        guard let card = notification.userInfo?["addCard"] as? AddCard else { return }
        DataTaskManager.post(category: card.category, data: card, completion: { (result) in
            DispatchQueue.global().async {
                switch result {
                case .success(let data):
                    let card = data.data
                    let title = card.title
                    
                    if data.data.category == 1 {
                        self.willDoCardManager.add(card: card)
                        self.taskManager.addTask(category: Category.WillDo.rawValue,
                                                 cardTitle: title, taskStyle: .new)
                    }else if data.data.category == 2 {
                        self.doingCardManager.add(card: card)
                        self.taskManager.addTask(category: Category.Doing.rawValue,
                                                 cardTitle: title, taskStyle: .new)
                    }else{
                        self.doneCardManager.add(card: card)
                        self.taskManager.addTask(category: Category.Done.rawValue,
                                                 cardTitle: title, taskStyle: .new)
                    }
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        })
    }
    
    @objc private func deleteCard(_ notification: Notification) {
        guard let category = notification.userInfo?["category"] as? Int else { return }
        guard let cardID = notification.userInfo?["cardID"] as? Int else { return }
        guard let title = notification.userInfo?["title"] as? String else { return }
        
        DataTaskManager.delete(category: category, cardID: cardID, completion: { (result) in
            DispatchQueue.global().async {
                switch result {
                case .success(_):
                    if category == 1 {
                        self.willDoCardManager.delete(cardAtPosition: cardID)
                        self.taskManager.addTask(category: Category.WillDo.rawValue, cardTitle: title, taskStyle: .delete)
                    }else if category == 2 {
                        self.doingCardManager.delete(cardAtPosition: cardID)
                        self.taskManager.addTask(category: Category.Doing.rawValue, cardTitle: title, taskStyle: .delete)
                    }else{
                        self.doneCardManager.delete(cardAtPosition: cardID)
                        self.taskManager.addTask(category: Category.Done.rawValue, cardTitle: title, taskStyle: .delete)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        })
    }
    
    @objc private func moveCard(_ notification: Notification) {
        guard let card = notification.userInfo?["card"] as? Card else { return }
        guard let toCategory = notification.userInfo?["toCategory"] as? Int else { return }
        guard let toIndex = notification.userInfo?["toIndex"] as? Int else { return }
        var cardIdNum: Int?
        if card.category == 1 {
            cardIdNum = willDoCardManager.index(of: card.cardId)
        }else if card.category == 2 {
            cardIdNum = doingCardManager.index(of: card.cardId)
        }else{
            cardIdNum = doneCardManager.index(of: card.cardId)
        }
        guard let startCardIndex = cardIdNum else { return }
        DataTaskManager.dragAndDropPut(startCartegoryID: card.category, startCardIndex: startCardIndex + 1, endCartegoryID: toCategory, endCardIndex: toIndex + 1, completion: { (result) in
            DispatchQueue.global().async {
                switch result {
                case .success(_):
                    self.loadCard()
                    
                    let allCategories = Category.allCases
                    let startCategory = allCategories[card.category-1].rawValue
                    let endCategory = allCategories[toCategory-1].rawValue
                    self.taskManager.addMoveTask(fromCategory: startCategory, toCategory: endCategory,
                                                 cardTitle: card.title)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        })
    }
}

enum SegueIdentifier: String {
    case WillDo = "WillDo"
    case Doing = "Doing"
    case Done = "Done"
}

enum Category: String, CaseIterable {
    case WillDo = "해야할 일"
    case Doing = "하고 있는 일"
    case Done = "완료한 일"
}
