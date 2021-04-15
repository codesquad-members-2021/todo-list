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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCard()
        NotificationCenter.default.addObserver(self, selector: #selector(postCard), name: CardManager.NotiKeys.addCard, object: nil)
    }

    @IBAction func sideMenuButtonTouched(_ sender: Any) {
        let sideMenuVC = SideMenuViewController(nibName: "SideMenuViewController", bundle: .none)
        self.present(sideMenuVC, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let toDoViewController = segue.destination as? ToDoViewController else { return }
        
        if segue.identifier == SegueIdentifier.WillDo.rawValue  {
            toDoViewController.cardManager = willDoCardManager
            toDoViewController.tableTitle = "해야할 일"
        } else if segue.identifier == SegueIdentifier.Doing.rawValue {
            toDoViewController.cardManager = doingCardManager
            toDoViewController.tableTitle = "하고 있는 일"
        } else if segue.identifier == SegueIdentifier.Done.rawValue {
            toDoViewController.cardManager = doneCardManager
            toDoViewController.tableTitle = "완료한 일"
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
        DataTaskManager.post(category: card.category, data: card)
    }
    
    private func deleteCard() {
        
    }
    
    private func putCard() {
        
    }
}

enum SegueIdentifier: String {
    case WillDo = "WillDo"
    case Doing = "Doing"
    case Done = "Done"
}
