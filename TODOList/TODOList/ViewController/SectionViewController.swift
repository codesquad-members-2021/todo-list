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
    private var exportViewModel: AppearViewModel!
    private var changeCardViewModel: ChangeCardViewModel!
    private var cards: [Card]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTitleText()
        
        self.sectionViewDataSource.dataSource = self
        
        guard let sectionMode = sectionMode else { return }
        self.exportViewModel = AppearViewModel(mode: sectionMode)
        self.changeCardViewModel = ChangeCardViewModel()
        
        self.exportViewModel.passingDataHandler = { cards in
            self.cards = cards
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
        let addView = self.storyboard?.instantiateViewController(withIdentifier: "AddView") as! AddViewController
        addView.modalPresentationStyle = .overCurrentContext
        guard let sectionMode = sectionMode else { return }
        addView.setSectionMode(mode: sectionMode)
        present(addView, animated: false, completion: nil)
    }
    
    private func setTitleText() {
        guard let mode = self.sectionMode else { return }
        self.sectionTitle.text = mode.sectionTitle
    }
    
    func passData() -> [Card]? {
        return self.cards
    }
    
    func setSectionMode(mode: SectionMode) {
        self.sectionMode = mode
    }
}


