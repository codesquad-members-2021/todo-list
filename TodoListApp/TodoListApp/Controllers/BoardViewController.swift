//
//  ViewController.swift
//  TodoListApp
//
//  Created by Song on 2021/04/06.
//

import UIKit

class BoardViewController: UIViewController {
    enum Identifier {
        static let goToTodo = "goToTodo"
        static let goToDoing = "goToDoing"
        static let goToDone = "goToDone"
    }
    
    private let networkManager = NetworkManager()
    private let mockupURL = "https://1103e5e3-f0a0-4aad-b037-2a5de4a68858.mock.pstmn.io/cards"
    private var allCards: [Card] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        networkManager.performRequest(urlString: mockupURL) { cards in
            self.allCards = cards
            let destinationViewController = segue.destination as! ListViewControllerProtocol
            if segue.identifier == Identifier.goToTodo {
                destinationViewController.updateViewControllerTitle(with: "해야할 일")
                destinationViewController.filterCards(of: "todo", from: self.allCards)
            } else if segue.identifier == Identifier.goToDoing {
                destinationViewController.updateViewControllerTitle(with: "하고 있는 일")
                destinationViewController.filterCards(of: "doing", from: self.allCards)
            } else if segue.identifier == Identifier.goToDone {
                destinationViewController.updateViewControllerTitle(with: "완료한 일")
                destinationViewController.filterCards(of: "done", from: self.allCards)
            }
            DispatchQueue.main.async {
                destinationViewController.refreshTableView()
            }
        }
    }
}

