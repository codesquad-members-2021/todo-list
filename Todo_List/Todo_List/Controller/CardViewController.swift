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
    
    var board = Board()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpDelegate()
        setNotificationCenter()
        registerNib()
        configureTextField()
    }
    
    @IBAction func didTouchAddButton(_ sender: UIButton) {
        let viewController = createModalViewController()
        self.present(viewController, animated: true)
        
        guard let typeIndex = addButtons.firstIndex(of: sender),
              let cardType = Board.CardType.init(rawValue: typeIndex)
        else {
            return
        }
        viewController.setHandler(handler: { [weak self] card in
            self?.board.append(with: card, type: cardType)
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
        NotificationCenter.default.addObserver(self, selector: #selector(reloadBoard), name: Board.TodoListChanged, object: board)
        NotificationCenter.default.addObserver(self, selector: #selector(reloadBoard), name: Board.DoingListChanged, object: board)
        NotificationCenter.default.addObserver(self, selector: #selector(reloadBoard), name: Board.DoneListChanged, object: board)
    }
    @objc func reloadBoard(){
        self.todo.reloadData()
        self.doing.reloadData()
        self.done.reloadData()
    }
}
// MARK: - Register Nib and Configuration
extension CardViewController {
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
