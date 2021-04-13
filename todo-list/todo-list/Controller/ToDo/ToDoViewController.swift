//
//  WillDoViewController.swift
//  todo-list
//
//  Created by sonjuhyeong on 2021/04/07.
//

import UIKit

class ToDoViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var badgeView: UIView!
    @IBOutlet weak var badgeLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var cardTableView: UITableView!
    private var toDoDelegate = ToDoTableViewDelegate()
    private var willDoDataSource: ToDoTableViewDataSource!
    private var doingDataSource: ToDoTableViewDataSource!
    private var doneDataSource: ToDoTableViewDataSource!

    var segueInfo: String?
    
    var willDocardManager = CardManager()
    var doingCardManager = CardManager()
    var doneCardManager = CardManager()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeDataSource()
        
        setDelegateAndDataSource()
        let nibName = UINib(nibName: "ToDoTableViewCell", bundle: .none)
        cardTableView.register(nibName, forCellReuseIdentifier: "tableCell")
        configureHeaderView()
        loadData()
        
        cardTableView.register(CardMargin.self, forHeaderFooterViewReuseIdentifier: "cardMargin")
    }
    
    @objc func didRecieveTestNotification(_ notification: Notification) {
        if segueInfo == SegueIdentifier.WillDo.rawValue {
            guard let userInfo = notification.userInfo?["TodoCount"] else { return }
            print(userInfo)
            badgeLabel.text = userInfo as? String
        }
    }
    
    @IBAction func addButtonTouched(_ sender: Any) {
        let addToDoVC = AddToDoViewController(nibName: "AddToDoViewController", bundle: .none)
        addToDoVC.modalPresentationStyle = .formSheet
        addToDoVC.preferredContentSize = CGSize(width: 400, height: 175)
        self.present(addToDoVC, animated: true, completion: nil)
    }
    
    //MARK: - Header View
    private func configureHeaderView() {
        updateHeaderViewLabel()
        setBadgeViewRadius()
    }
    
    private func updateHeaderViewLabel() {
        if segueInfo == SegueIdentifier.WillDo.rawValue {
            titleLabel.text = "해야할 일"
        } else if segueInfo == SegueIdentifier.Doing.rawValue {
            titleLabel.text = "하고 있는 일"
        } else if segueInfo == SegueIdentifier.Done.rawValue {
            titleLabel.text = "완료한 일"
        }
    }
    
    private func setBadgeViewRadius() {
        let radius = badgeView.bounds.height * 0.5
        badgeView.layer.cornerRadius = radius
    }

    
    //MARK: - DataSource Method
    private func setDelegateAndDataSource() {
        cardTableView.delegate = toDoDelegate
        if segueInfo == SegueIdentifier.WillDo.rawValue {
            cardTableView.dataSource = willDoDataSource
        } else if segueInfo == SegueIdentifier.Doing.rawValue {
            cardTableView.dataSource = doingDataSource
        } else if segueInfo == SegueIdentifier.Done.rawValue {
            cardTableView.dataSource = doneDataSource
        }
    }
    private func initializeDataSource() {
        willDoDataSource = ToDoTableViewDataSource(cardManager: willDocardManager)
        doingDataSource = ToDoTableViewDataSource(cardManager: doingCardManager)
        doneDataSource = ToDoTableViewDataSource(cardManager: doneCardManager)
    }
    
    //MARK: - LoadData Method
    private func loadData() {
        DataTaskManager.request(completion: { (result) in
            DispatchQueue.global().async {
                switch result {
                case .success(let data):
                    self.willDocardManager.update(cardList: data.todo)
                    self.doingCardManager.update(cardList: data.doing)
                    self.doneCardManager.update(cardList: data.done)
                    DispatchQueue.main.async { [weak self] in
                        self?.cardTableView.reloadData()
                    }
                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
        })
    }
}

extension ToDoViewController: UITableViewDelegate {
    
}


