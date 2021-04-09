//
//  MainViewController.swift
//  ToDoListApp
//
//  Created by zombietux on 2021/04/07.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var cardViewModel: CardViewModel!
    private var boards: [BoardManageable]! // ViewModel로 옮길 필요가 있음
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        self.cardViewModel = CardViewModel()
        self.boards = cardViewModel.get()
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.boards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCell.identifier, for: indexPath) as? MainCell else { return UICollectionViewCell() }

        cell.setup(with: boards[indexPath.item])
        cell.titleLabel.text = boards[indexPath.row].getTitle()
        
        return cell
    }
}
