//
//  MainViewController.swift
//  ToDoListApp
//
//  Created by zombietux on 2021/04/07.
//

import UIKit
import Combine

class MainViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var cardViewModel: CardViewModel!
    private var loadDataSubject = PassthroughSubject<Void,Never>()
    private var subsciptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        self.cardViewModel = CardViewModel()
        cardViewModel.requestBoard()
        bind()
    }

    @IBAction func addCard(_ sender: Any) {
        loadDataSubject.send()
    }
    
    func bind() {
        cardViewModel.$boards
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in}, receiveValue:{ [weak self] _ in self?.collectionView.reloadData() })
            .store(in: &self.subsciptions)
        
        //Test
//        cardViewModel.attachViewEventListener(loadData: loadDataSubject.eraseToAnyPublisher(), cardState: .todo)
//        cardViewModel.reloadCardList
//                    .sink(receiveCompletion: { completion in
//                        // Handle the error
//                    }) { [weak self] _ in
//                        print("이벤트를 뷰모델에 전달했습니다.")
//                        self?.collectionView.reloadData()
//                }
//                .store(in: &subsciptions)
//            }
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cardViewModel.boards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCell.identifier, for: indexPath) as? MainCell else { return UICollectionViewCell() }

        cell.setup(with: cardViewModel.boards[indexPath.item])
        cell.titleLabel.text = cardViewModel.boards[indexPath.item].getTitle()
        cell.boardCountLabel.text = "\(cardViewModel.boards[indexPath.item].getBoard().count())"
        cell.inputButton.tag = indexPath.row
        cell.inputButton.addTarget(self, action: #selector(presentInputVC(_:)), for: .touchUpInside)
        
        return cell
    }
    
    @objc func presentInputVC(_ sender: UIButton) {
        guard let inputViewController = self.storyboard?.instantiateViewController(withIdentifier: "InputViewController") as? InputViewController else { return }
        inputViewController.modalPresentationStyle = .overCurrentContext
        inputViewController.mode = "add"
        present(inputViewController, animated: false, completion: nil)
    }
}
