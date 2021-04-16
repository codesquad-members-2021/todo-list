//
//  firstChildViewController.swift
//  TodoList
//
//  Created by 조중윤 on 2021/04/07.
//

import UIKit

class ToDoViewController: UIViewController {
    let toDoTableViewDelegates = ToDoTableViewDelegates()
    
    @IBOutlet weak var toDoItemTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(toDoItemListHasBeenChanged), name: .didChangeToDoItemList, object: nil)
        
        self.toDoItemTableView.dataSource = toDoTableViewDelegates
        self.toDoItemTableView.delegate = toDoTableViewDelegates
        self.toDoItemTableView.dragDelegate = toDoTableViewDelegates
        self.toDoTableViewDelegates.popUpViewProtocol = self
        self.toDoItemTableView.rowHeight = 150
        
        self.toDoItemTableView.register(UINib(nibName: "ToDoItemCell", bundle: nil), forCellReuseIdentifier: "ToDoItemCell")
        toDoItemTableView.register(CustomHeader.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
        
        toDoTableViewDelegates.fetchItems()
    }
    
    @objc func toDoItemListHasBeenChanged() {
        DispatchQueue.main.async {
            self.toDoItemTableView.reloadData()
        }
    }
    
    func presentPopUp() {
        let popUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: Constants.popUpVCIdentifier) as! PopUpViewController
        popUpVC.modalPresentationStyle = .overFullScreen
        popUpVC.setPromptMessage(message: "뭘 해야 하지?")
        popUpVC.setStatus(status: "TODO")
        popUpVC.abilityToFetchData = self
        self.present(popUpVC, animated: true, completion: nil)
    }
}

extension ToDoViewController: PopUpViewProtocol {
    func triggerPopUp() {
        presentPopUp()
    }
}

extension ToDoViewController: AbilityToFetchData {
    func fetchData() {
        self.toDoTableViewDelegates.fetchItems()
    }
}
