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

        DataTaskManager.request(completion: { (result) in
            DispatchQueue.global().async {
                switch result {
                case .success(let data):
                    self.willDoCardManager.configure(cardList: data[0].todos, categoryID: data[0].id)
                    self.doingCardManager.configure(cardList: data[1].todos, categoryID: data[1].id)
                    self.doneCardManager.configure(cardList: data[2].todos, categoryID: data[2].id)
                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
        })
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
