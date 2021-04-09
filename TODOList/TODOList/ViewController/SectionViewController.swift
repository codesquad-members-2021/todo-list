//
//  SectionViewController.swift
//  TODOList
//
//  Created by Issac on 2021/04/06.
//

import UIKit

protocol DataPassable: class {
    func passData() -> Status?
}

class SectionViewController: UIViewController, DataPassable {
    @IBOutlet weak private var TODOTableView: UITableView!
    @IBOutlet private var SectionViewDataSource: SectionViewDataSource!
    @IBOutlet weak private var sectionTitle: UILabel!
    @IBOutlet weak private var TODOCount: UILabel!
    @IBOutlet weak private var addButton: UIButton!
    private var sectionMode: Mode?
    private var exportViewModel: AppearViewModel!
    private var status: Status!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTitleText()
        
        self.SectionViewDataSource.dataSource = self
        
        guard let sectionMode = sectionMode else { return }
        self.exportViewModel = AppearViewModel(mode: sectionMode)
        
        self.exportViewModel.passingDataHandler = { status in
            self.status = status
            DispatchQueue.main.async {
                self.TODOTableView.reloadData()
            }
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
    
    func passData() -> Status? {
        return self.status
    }
    
    func setSectionMode(mode: Mode) {
        self.sectionMode = mode
    }
}


