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
    private var id: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        setupTitle()
    }
    
    private func setupTitle() {
        let title = mode == "add" ? "새로운 카드 추가" : "카드 수정"
        self.titleLabel.text = title
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
    
    func setupId(_ id: Int) {
        self.id = id
    }
    
    func bind() {
        cardViewModel?.attachViewEventListener(loadData: loadDataSubject.eraseToAnyPublisher(), columnId: self.columnId ?? 0)
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: false, completion: .none)
    }
    
    @IBAction func enrollmentButtonTapped(_ sender: UIButton) {
        loadDataSubject.send()
    }
}
