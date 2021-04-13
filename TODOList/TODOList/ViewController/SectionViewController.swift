//
//  SectionViewController.swift
//  TODOList
//
//  Created by Issac on 2021/04/06.
//

import UIKit

protocol DataPassable: class {
    func passData() -> [Card]?
}

class SectionViewController: UIViewController, DataPassable {
    @IBOutlet weak private var TODOTableView: UITableView!
    @IBOutlet private var sectionViewDataSource: SectionViewDataSource!
    @IBOutlet weak private var sectionTitle: UILabel!
    @IBOutlet weak private var TODOCount: UILabel!
    @IBOutlet weak private var addButton: UIButton!
    private var sectionMode: SectionMode?
    private var appearViewModel: AppearViewModel!
    private var changeCardViewModel: ChangeCardViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTitleText()
        
        self.sectionViewDataSource.dataSource = self
        self.setTODOTableView()
        
        guard let sectionMode = sectionMode else { return }
        self.appearViewModel = AppearViewModel(mode: sectionMode)
        self.changeCardViewModel = ChangeCardViewModel()
        
        self.changeCardViewModel.addCardHandler = { card in
            self.appearViewModel.frontEnqueue(card: card)
            DispatchQueue.main.async {
                self.TODOTableView.reloadData()
            }
        }
        
        self.appearViewModel.passingDataHandler = { cards in
            let cards = self.appearViewModel.cards
            DispatchQueue.main.async {
                self.TODOCount.text = "\(cards.count)"
                self.TODOTableView.reloadData()
            }
        }
        
        self.sectionViewDataSource.deleteCard = { card in
            self.changeCardViewModel.deleteCard(card: card)
        }
    }
    
    @IBAction func tapAddButton(_ sender: UIButton) {
        let addView = self.storyboard?.instantiateViewController(withIdentifier: AddViewController.identifier) as! AddViewController
        addView.modalPresentationStyle = .overCurrentContext
        guard let sectionMode = sectionMode else { return }
        addView.setSectionMode(mode: sectionMode)
        addView.modalTransitionStyle = .crossDissolve
        present(addView, animated: true, completion: nil)
    }
    
    private func setTitleText() {
        guard let mode = self.sectionMode else { return }
        self.sectionTitle.text = mode.sectionTitle
        self.sectionTitle.sizeToFit()
    }
    
    private func setTODOTableView() {
        self.TODOTableView.rowHeight = UITableView.automaticDimension
        self.TODOTableView.estimatedRowHeight = 500
    }
    
    func passData() -> [Card]? {
        return self.appearViewModel.cards
    }
    
    func setSectionMode(mode: SectionMode) {
        self.sectionMode = mode
    }
}
