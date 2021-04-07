//
//  SectionViewController.swift
//  TODOList
//
//  Created by Issac on 2021/04/06.
//

import UIKit

protocol CellInfoDelegate {
    func sendData()
}

class State {
    var subject: [String]
    var body: [String]
    
    init() {
        self.subject = [String]()
        self.body = [String]()
    }
}

enum Mode {
    case willTODO
    case doingTODO
    case completeTODO
}

class SectionViewController: UIViewController {
    @IBOutlet weak var TODOTableView: UITableView!
    @IBOutlet var TODOTableViewDataSource: TODOTableViewDataSource!
    @IBOutlet weak var sectionTitle: UILabel!
    @IBOutlet weak var TODOCount: UILabel!
    @IBOutlet weak var addButton: UIButton!
    var mode: Mode?
    
    var handler: ((State) -> ())? {
        didSet {
            self.TODOTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}


