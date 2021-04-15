//
//  TaskViewController.swift
//  Todo_List
//
//  Created by 박혜원 on 2021/04/07.
//

import UIKit

class CardViewController: UIViewController {
    
    
    @IBOutlet weak var todo: UITableView!
    @IBOutlet weak var doing: UITableView!
    @IBOutlet weak var done: UITableView!
    
    @IBOutlet weak var countOfTodo: UILabel!
    @IBOutlet weak var countOfDoing: UILabel!
    @IBOutlet weak var countOfDone: UILabel!
    
    @IBOutlet var addButtons : [UIButton]!
    
    var todoDataSource : TableViewDataSource?
    var doingDataSource : TableViewDataSource?
    var doneDataSource : TableViewDataSource?
    
    var todoDelegate : TableViewDelegate?
    var doingDelegate : TableViewDelegate?
    var doneDelegate : TableViewDelegate?
    
    var todoDragDelegate : TableViewDragDelegate?
    var doingDragDelegate : TableViewDragDelegate?
    var doneDragDelegate : TableViewDragDelegate?
    
    var todoDropDelegate : TableViewDropDelegate?
    var doingDropDelegate : TableViewDropDelegate?
    var doneDropDelegate : TableViewDropDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        setDataSource()
        setDragDelegate()
        setDropDelegate()
        
        DispatchQueue.main.async {
            CardAPIClient().loadAllCards(completion: { [weak self] result in
                switch result {
                case .success(let cards) :
                    self?.todoDataSource?.cards.items = cards.todo
                    self?.doingDataSource?.cards.items = cards.doing
                    self?.doneDataSource?.cards.items = cards.done
                    self?.reloadBoard()
                case .failure(let error) : print(error)
                }
            })
        }
        setNotificationCenter()
        registerNib()
        configureTextField()
    }
    
    @IBAction func didTouchAddButton(_ sender: UIButton) {
        let viewController = createModalViewController()
        self.present(viewController, animated: true)
        
        guard let typeIndex = addButtons.firstIndex(of: sender),
              let cardType = CardType.init(rawValue: typeIndex)
        else {
            return
        }
        viewController.setHandler(handler: { [weak self] card in
            switch cardType {
            case .todo:
                CardAPIClient().createCard(with: card, type: "todo", completion: { card in
                    self?.todoDataSource?.cards.append(with: card)
                    self?.reloadBoard()
                })
            case .doing:
                CardAPIClient().createCard(with: card, type: "doing", completion: { card in
                    self?.doingDataSource?.cards.append(with: card)
                    self?.reloadBoard()
                })
            case .done:
                CardAPIClient().createCard(with: card, type: "done", completion: { card in
                    self?.doneDataSource?.cards.append(with: card)
                    self?.reloadBoard()
                })
            }
        })
    }
    func createModalViewController() -> ModalViewController{
        let storyboard = UIStoryboard(name: "Modal", bundle: nil)
        let viewcontroller = storyboard.instantiateViewController(identifier: "Modal") as! ModalViewController
        
        viewcontroller.definesPresentationContext = true
        viewcontroller.modalPresentationStyle = .formSheet
        return viewcontroller
    }
}
// MARK: - Notification Fucntion
extension CardViewController {
    func setNotificationCenter(){
        NotificationCenter.default.addObserver(self, selector: #selector(CardViewController.reloadBoard), name: Cards.ListChanged, object: nil)
    }
    @objc func reloadBoard(){
        DispatchQueue.main.async {
            self.todo.reloadData()
            self.doing.reloadData()
            self.done.reloadData()
        }
    }
}
// MARK: - Register Nib and Configuration
extension CardViewController {
    func setDelegate(){
        // table view delegate
        self.todoDelegate = TableViewDelegate()
        self.doingDelegate = TableViewDelegate()
        self.doneDelegate = TableViewDelegate()
        
        self.todo.delegate = self.todoDelegate
        self.doing.delegate = self.doingDelegate
        self.done.delegate = self.doneDelegate
    }
    func setDataSource(){
        // Data source
        self.todoDataSource = TableViewDataSource()
        self.doingDataSource = TableViewDataSource()
        self.doneDataSource = TableViewDataSource()
        
        self.todo.dataSource = self.todoDataSource
        self.doing.dataSource = self.doingDataSource
        self.done.dataSource = self.doneDataSource
    }
    func setDragDelegate(){
        // drag delegate
        self.todoDragDelegate = TableViewDragDelegate(withDataSource: todoDataSource!)
        self.doingDragDelegate = TableViewDragDelegate(withDataSource: doingDataSource!)
        self.doneDragDelegate = TableViewDragDelegate(withDataSource: doneDataSource!)
        
        self.todo.dragDelegate = self.todoDragDelegate
        self.doing.dragDelegate = self.doingDragDelegate
        self.done.dragDelegate = self.doneDragDelegate
    }
    func setDropDelegate(){
        self.todoDropDelegate = TableViewDropDelegate(withDataSource: todoDataSource!, type: .todo)
        self.doingDropDelegate = TableViewDropDelegate(withDataSource: doingDataSource!, type: .doing)
        self.doneDropDelegate = TableViewDropDelegate(withDataSource: doneDataSource!, type: .done)
        
        self.todo.dropDelegate = self.todoDropDelegate
        self.doing.dropDelegate = self.doingDropDelegate
        self.done.dropDelegate = self.doneDropDelegate
    }
    func registerNib(){
        let nibName = UINib(nibName: "CardCell", bundle: nil)
        /*각각 register 하여서 각 tableView마다 속성값을 관리할 수 있다.*/
        todo.register(nibName, forCellReuseIdentifier: "CardCell")
        doing.register(nibName, forCellReuseIdentifier: "CardCell")
        done.register(nibName, forCellReuseIdentifier: "CardCell")
    }
    func configureTextField(){
        todo.rowHeight = UITableView.automaticDimension
        todo.estimatedRowHeight = CardViewConstant.estimatedRowHeight
        
        doing.rowHeight = UITableView.automaticDimension
        doing.estimatedRowHeight = CardViewConstant.estimatedRowHeight
        
        done.rowHeight = UITableView.automaticDimension
        done.estimatedRowHeight = CardViewConstant.estimatedRowHeight
    }
}
