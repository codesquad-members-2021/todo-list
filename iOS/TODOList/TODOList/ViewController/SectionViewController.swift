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
    private var appearViewModel: CardOutputViewModel!
    private var changeCardViewModel: CardInputViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sectionViewDataSource.dataSource = self
        self.setTODOTableView()
        guard let sectionMode = sectionMode else { return }
        self.appearViewModel = AppearViewModel(mode: sectionMode)
        self.changeCardViewModel = ChangeCardViewModel()
        self.initHTTPMethodHandler()
        self.setTitleText()
        self.setTODOCount()
    }
    
    private func initHTTPMethodHandler() {
        self.changeCardViewModel.addCardHandler = { card in
            self.appearViewModel.frontEnqueue(card: card)
            DispatchQueue.main.async {
                self.setTODOCount()
                self.TODOTableView.reloadData()
            }
        }
        
        self.appearViewModel.getDataHandler = {
            DispatchQueue.main.async {
                self.setTODOCount()
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
    
    private func setTODOCount() {
        self.TODOCount.text = "\(self.appearViewModel.cards.count)"
    }
    
    private func setTitleText() {
        guard let mode = self.sectionMode else { return }
        self.sectionTitle.text = mode.sectionTitle
        self.sectionTitle.sizeToFit()
    }
    
    private func setTODOTableView() {
        self.TODOTableView.rowHeight = UITableView.automaticDimension
        self.TODOTableView.estimatedRowHeight = 500
        self.TODOTableView.dragInteractionEnabled = true
    }
    
    func passData() -> [Card]? {
        return self.appearViewModel.cards
    }
    
    func setSectionMode(mode: SectionMode) {
        self.sectionMode = mode
    }
}
