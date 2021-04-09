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
    
    var board = Board()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpDelegate()
        registerNib()
        configureTextField()
    }
    @IBAction func todoPlus(_ sender: UIButton) {
    
        let viewcontroller = createModalViewController()
        self.present(viewcontroller, animated: true)
        
        viewcontroller.setHandler { [weak self] card in
            self?.board.apepnd(with: card, type: .todo)
            self?.todo.reloadData()
        }
        
    }
    @IBAction func doingPlus(_ sender: UIButton) {
        let viewcontroller = createModalViewController()
        self.present(viewcontroller, animated: true)
        
        viewcontroller.setHandler { [weak self] card in
            self?.board.apepnd(with: card, type: .doing)
            self?.doing.reloadData()
        }
    }
    @IBAction func donePlus(_ sender: UIButton) {
        let viewcontroller = createModalViewController()
        self.present(viewcontroller, animated: true)
        
        viewcontroller.setHandler { [weak self] card in
            self?.board.apepnd(with: card, type: .done)
            self?.done.reloadData()
        }
    }
    func createModalViewController() -> ModalViewController{
        let storyboard = UIStoryboard(name: "Modal", bundle: nil)
        let viewcontroller = storyboard.instantiateViewController(identifier: "Modal") as! ModalViewController
        
        viewcontroller.definesPresentationContext = true
        viewcontroller.modalPresentationStyle = .formSheet
        return viewcontroller
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
