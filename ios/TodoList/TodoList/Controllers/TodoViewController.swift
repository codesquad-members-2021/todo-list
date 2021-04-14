//
//  firstChildViewController.swift
//  TodoList
//
//  Created by 조중윤 on 2021/04/07.
//

import UIKit

class ToDoViewController: UIViewController {
    let toDoTableViewDelegates = ToDoTableViewDelegates()
    
    @IBOutlet weak var toDoCardTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(toDoCardsListHasBeenChanged), name: .didChangeToDoCardsList, object: nil)
        print(self)
        
        self.toDoCardTableView.dataSource = toDoTableViewDelegates
        self.toDoCardTableView.delegate = toDoTableViewDelegates
        self.toDoTableViewDelegates.popUpViewProtocol = self
        self.toDoCardTableView.rowHeight = 150
        
        self.toDoCardTableView.register(UINib(nibName: "ToDoCardCell", bundle: nil), forCellReuseIdentifier: "ToDoCardCell")
        toDoCardTableView.register(CustomHeader.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
        
        toDoTableViewDelegates.fetchCards()
        
    }
    
    @objc func toDoCardsListHasBeenChanged() {
        DispatchQueue.main.async {
            self.toDoCardTableView.reloadData()
        }
    }

//    func getTopMostViewController() -> UIViewController? {
//        var topMostViewController = UIApplication.shared.keyWindow?.rootViewController
//
//        while let presentedViewController = topMostViewController?.presentedViewController {
//            topMostViewController = presentedViewController
//        }
//
//        return topMostViewController
//    }
    
    func presentPopUp() {
        let popUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: Constants.popUpVCIdentifier)
        popUpVC.modalPresentationStyle = .overFullScreen
        //UIAction 한 번 터치하면 두번 클릭되는 에러가 있었다.
        //modal presentaion Style fullscreen으로 하니 백그라운드가 돌아가면서 프레젠트됨. overFullScreen으로 하니 해결
        self.present(popUpVC, animated: true, completion: nil)
    }
}

extension ToDoViewController: PopUpViewProtocol {
    func triggerPopUp() {
        print("\\pop up triggered\\")
        presentPopUp()
    }
}

