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
    
    private var toDoDelegate: ToDoTableViewDelegate!
    private var toDoDataSource: ToDoTableViewDataSource!
    private var toDoDragDelegate: ToDoTableViewDragDelegate!
    private var toDoDropDelegate: ToDoTableViewDropDelegate!

    var tableTitle: String!
    var cardManager: CardManager!

    override func viewDidLoad() {
        super.viewDidLoad()
 
        configureHeaderView()
        setDelegateAndDataSource()
        setXib()
        setNotification()
    }
        
    @IBAction func addButtonTouched(_ sender: Any) {
        let addToDoVC = AddToDoViewController(nibName: "AddToDoViewController", bundle: .none, cardAdder: cardManager)
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
        titleLabel.text = tableTitle
    }
    
    private func setBadgeViewRadius() {
        //badgeView.swift 만들어서 init 시 자동으로 설정하게 바꾸는 게 좋을듯
        let radius = badgeView.bounds.height * 0.5
        badgeView.layer.cornerRadius = radius
    }

    
    //MARK: - DataSource Method
    private func setDelegateAndDataSource() {
        toDoDelegate = ToDoTableViewDelegate()
        cardTableView.delegate = toDoDelegate
        
        toDoDataSource = ToDoTableViewDataSource(cardSearcher: cardManager)
        cardTableView.dataSource = toDoDataSource
        
        toDoDragDelegate = ToDoTableViewDragDelegate(cardSearcher: cardManager)
        cardTableView.dragDelegate = toDoDragDelegate
        
        toDoDropDelegate = ToDoTableViewDropDelegate(cardSearcher: cardManager)
        cardTableView.dropDelegate = toDoDropDelegate
    }
    
    //MARK: - Xib Setting
    private func setXib() {
        setCell()
        setMarginCell()
    }
    
    private func setCell() {
        let nibName = UINib(nibName: "ToDoTableViewCell", bundle: .none)
        cardTableView.register(nibName, forCellReuseIdentifier: "tableCell")
    }
    
    private func setMarginCell() {
        cardTableView.register(CardMargin.self, forHeaderFooterViewReuseIdentifier: "cardMargin")
    }
    
    //MARK: - Notification Setting
    private func setNotification() {
        setCountNoti()
    }
    
    private func setCountNoti() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didRecieveTestNotification(_:)),
                                               name: CardManager.NotiKeys.countChanged,
                                               object: cardManager.self)
    }
    
    @objc func didRecieveTestNotification(_ notification: Notification) {
        guard let count = notification.userInfo?["count"] as? Int else { return }
        DispatchQueue.main.async {
            self.badgeLabel.text = "\(count)"
            self.cardTableView.reloadData()
        }
    }
}
