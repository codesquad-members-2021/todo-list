//
//  ViewController.swift
//  TODOList
//
//  Created by Issac on 2021/04/06.
//

import UIKit

class TODOViewController: UIViewController {
    enum Segues {
        static let willTODO = "WillTODO"
        static let doingTODO = "DoingTODO"
        static let completeTODO = "CompleteTODO"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.willTODO {
            guard let viewController = segue.destination as? SectionViewController else { return }
            viewController.setSectionMode(mode: .willTODO)
        } else if segue.identifier == Segues.doingTODO {
            guard let viewController = segue.destination as? SectionViewController else { return }
            viewController.setSectionMode(mode: .doingTODO)
        } else if segue.identifier == Segues.completeTODO {
            guard let viewController = segue.destination as? SectionViewController else { return }
            viewController.setSectionMode(mode: .completeTODO)
        }
    }
}

