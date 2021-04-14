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
        loadData()
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
    
    private func loadData() {
        let card1 = Card(id: 1, title: "test", contents: "testtest", createDateTime: "dddd", status: "dddd")
        let card2 = Card(id: 2, title: "test", contents: "testtest", createDateTime: "dddd", status: "dddd")
        let card3 = Card(id: 3, title: "test", contents: "testtest", createDateTime: "dddd", status: "dddd")
        
        willDoCardManager.configure(cardList: [card1, card2, card3], categoryID: "1")
        doingCardManager.configure(cardList: [card1, card2], categoryID: "2")
        doneCardManager.configure(cardList: [card1], categoryID: "3")
//        DataTaskManager.request(completion: { (result) in
//            DispatchQueue.global().async {
//                switch result {
//                case .success(let data):
//                    self.cardManagers[0].update(cardList: data.todo)
//                    self.cardManagers[1].update(cardList: data.doing)
//                    self.cardManagers[2].update(cardList: data.done)
//                case.failure(let error):
//                    print(error.localizedDescription)
//                }
//            }
//        })
    }
    
    private func patch() {
        
    }
    
    private func delete() {
        
    }
    
    private func put() {
        
    }
}

enum SegueIdentifier: String {
    case WillDo = "WillDo"
    case Doing = "Doing"
    case Done = "Done"
}
