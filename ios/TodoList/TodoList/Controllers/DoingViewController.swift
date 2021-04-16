//
//  DoingViewController.swift
//  TodoList
//
//  Created by 조중윤 on 2021/04/08.
//

import UIKit

class DoingViewController: UIViewController {
    let doingTableViewDelegates = DoingTableViewDelegates()
    
    @IBOutlet weak var doingItemTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(doingItemListHasBeenChanged), name: .didChangeDoingItemList, object: nil)
        
        self.doingItemTableView.dataSource = doingTableViewDelegates
        self.doingItemTableView.delegate = doingTableViewDelegates
        self.doingItemTableView.dragDelegate = doingTableViewDelegates
        self.doingTableViewDelegates.popUpViewProtocol = self
        self.doingItemTableView.rowHeight = 150
        
        self.doingItemTableView.register(UINib(nibName: "ToDoItemCell", bundle: nil), forCellReuseIdentifier: "ToDoItemCell")
        doingItemTableView.register(CustomHeader.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
        
        doingTableViewDelegates.fetchItems()
    }
    
    @objc func doingItemListHasBeenChanged() {
        DispatchQueue.main.async {
            self.doingItemTableView.reloadData()
        }
    }
    
    func presentPopUp() {
        let popUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: Constants.popUpVCIdentifier) as! PopUpViewController
        popUpVC.modalPresentationStyle = .overFullScreen
        popUpVC.setPromptMessage(message: "뭘 하고 있지?")
        popUpVC.setStatus(status: "DOING")
        popUpVC.abilityToFetchData = self
        self.present(popUpVC, animated: true, completion: nil)
    }
}

extension DoingViewController: PopUpViewProtocol {
    func triggerPopUp() {
        presentPopUp()
    }
}

extension DoingViewController: AbilityToFetchData {
    func fetchData() {
        self.doingTableViewDelegates.fetchItems()
    }
}
