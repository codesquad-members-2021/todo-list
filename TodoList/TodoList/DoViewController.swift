//
//  DoViewController.swift
//  TodoList
//
//  Created by HOONHA CHOI on 2021/04/06.
//

import UIKit

class DoViewController: UIViewController {

    @IBOutlet weak var DoCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DoCollection.dataSource = self
        DoCollection.delegate = self
    }

}

extension DoViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "do", for: indexPath)
        cell.layer.cornerRadius = 10
        
        return cell
    }
}

extension DoViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 150)
    }
}
