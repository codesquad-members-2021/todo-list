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
    var subsciptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        self.cardViewModel = CardViewModel()
        cardViewModel.requestBoard()
        bind()
    }
    
    func bind() {
        cardViewModel.$boards
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in}, receiveValue:{ [weak self] _ in self?.collectionView.reloadData() })
            
            .store(in: &self.subsciptions)
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cardViewModel.boards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCell.identifier, for: indexPath) as? MainCell else { return UICollectionViewCell() }
        
        cell.setup(with: cardViewModel.boards[indexPath.item])
        cell.titleLabel.text = cardViewModel.boards[indexPath.row].title
        
        return cell
    }
}

