//
//  DoingViewController.swift
//  TodoList
//
//  Created by 조중윤 on 2021/04/08.
//

import UIKit

class DoingViewController: UIViewController {
    let doingTableViewDelegates = DoingTableViewDelegates()
    
    @IBOutlet weak var doingCardTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(doingCardsListHasBeenChanged), name: .didChangeDoingCardsList, object: nil)
        
        self.doingCardTableView.dataSource = doingTableViewDelegates
        self.doingCardTableView.delegate = doingTableViewDelegates
        self.doingTableViewDelegates.popUpViewProtocol = self
        self.doingCardTableView.rowHeight = 150
        
        self.doingCardTableView.register(UINib(nibName: "ToDoCardCell", bundle: nil), forCellReuseIdentifier: "ToDoCardCell")
        doingCardTableView.register(CustomHeader.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
        
        doingTableViewDelegates.fetchCards()
    }
    
    @objc func doingCardsListHasBeenChanged() {
        DispatchQueue.main.async {
            self.doingCardTableView.reloadData()
        }
    }
    
    func presentPopUp() {
        let popUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: Constants.popUpVCIdentifier) as! PopUpViewController
        popUpVC.modalPresentationStyle = .overFullScreen
        popUpVC.setPromptMessage(message: "하고 있는 일 추가")
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
        self.doingTableViewDelegates.fetchCards()
    }
}
