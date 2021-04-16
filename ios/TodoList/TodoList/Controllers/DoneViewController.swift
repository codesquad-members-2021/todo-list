//
//  DoneViewController.swift
//  TodoList
//
//  Created by 조중윤 on 2021/04/08.
//

import UIKit

class DoneViewController: UIViewController {
    let doneTableViewDelegates = DoneTableViewDelegates()
    
    @IBOutlet weak var doneItemTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(doneItemListHasBeenChanged), name: .didChangeDoneItemList, object: nil)
        
        self.doneItemTableView.dataSource = doneTableViewDelegates
        self.doneItemTableView.delegate = doneTableViewDelegates
        self.doneItemTableView.dragDelegate = doneTableViewDelegates
        self.doneTableViewDelegates.popUpViewProtocol = self
        self.doneItemTableView.rowHeight = 150
        
        self.doneItemTableView.register(UINib(nibName: "ToDoItemCell", bundle: nil), forCellReuseIdentifier: "ToDoItemCell")
        doneItemTableView.register(CustomHeader.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
        
        doneTableViewDelegates.fetchItems()
    }
    
    @objc func doneItemListHasBeenChanged() {
        DispatchQueue.main.async {
            self.doneItemTableView.reloadData()
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
        self.doneTableViewDelegates.fetchItems()
    }
}
