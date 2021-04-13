//
//  InputViewController.swift
//  ToDoListApp
//
//  Created by zombietux on 2021/04/10.
//

import UIKit
import Combine

class InputViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var enrollmentButton: UIButton!
    @IBOutlet var inputTextFields: [UITextField]!
    
    private var loadDataSubject = PassthroughSubject<Void,Never>()
    private var subsciptions = Set<AnyCancellable>()
    private var cardViewModel: CardViewModel?
    private var mode: String?
    private var columnId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        enrollmentButton.addTarget(self, action: #selector(test), for: .touchDown)
    }
    
    @objc
    func test() {
        
    }
    
    private func setupTitle() {
        
    }
    
    func setupCardViewModel(_ viewModel: CardViewModel) {
        self.cardViewModel = viewModel
    }
    
    func setupMode(_ mode: String) {
        self.mode = mode
    }
    
    func setupColumnId(_ columnId: Int) {
        self.columnId = columnId
    }
    
    func bind() {
        cardViewModel?.attachViewEventListener(loadData: loadDataSubject.eraseToAnyPublisher(), cardState: .todo)
        cardViewModel?.attachViewEventListener(loadData: loadDataSubject.eraseToAnyPublisher(), cardState: .doing)
        cardViewModel?.attachViewEventListener(loadData: loadDataSubject.eraseToAnyPublisher(), cardState: .done)
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: false, completion: .none)
    }
    
    @IBAction func enrollmentButtonTapped(_ sender: UIButton) {
        loadDataSubject.send()
    }
}
