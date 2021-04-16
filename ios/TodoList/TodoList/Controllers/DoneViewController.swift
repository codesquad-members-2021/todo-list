//
//  DoneViewController.swift
//  TodoList
//
//  Created by 조중윤 on 2021/04/08.
//

import UIKit

class DoneViewController: UIViewController {
    let doneTableViewDelegates = DoneTableViewDelegates()
    
    @IBOutlet weak var doneCardTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(doneCardsListHasBeenChanged), name: .didChangeCompletedCardsLists, object: nil)
        
        self.doneCardTableView.dataSource = doneTableViewDelegates
        self.doneCardTableView.delegate = doneTableViewDelegates
        self.doneTableViewDelegates.popUpViewProtocol = self
        self.doneCardTableView.rowHeight = 150
        
        self.doneCardTableView.register(UINib(nibName: "ToDoCardCell", bundle: nil), forCellReuseIdentifier: "ToDoCardCell")
        doneCardTableView.register(CustomHeader.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
        
        doneTableViewDelegates.fetchCards()
    }
    
    @objc func doneCardsListHasBeenChanged() {
        DispatchQueue.main.async {
            self.doneCardTableView.reloadData()
        }
    }
    
    func presentPopUp() {
        let popUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: Constants.popUpVCIdentifier) as! PopUpViewController
        popUpVC.modalPresentationStyle = .overFullScreen
        popUpVC.setPromptMessage(message: "끝낸 일")
        popUpVC.setStatus(status: "DONE")
        popUpVC.abilityToFetchData = self
        self.present(popUpVC, animated: true, completion: nil)
    }
}

extension DoneViewController: PopUpViewProtocol {
    func triggerPopUp() {
        presentPopUp()
    }
}

extension DoneViewController: AbilityToFetchData {
    func fetchData() {
        self.doneTableViewDelegates.fetchCards()
    }
}
