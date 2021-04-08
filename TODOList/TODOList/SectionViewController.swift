//
//  SectionViewController.swift
//  TODOList
//
//  Created by Issac on 2021/04/06.
//

import UIKit

protocol PassableData: class {
    func passData() -> Status
}

enum Mode {
    case willTODO
    case doingTODO
    case completeTODO
}

enum TODODataType {
    case subject
}

struct Status {
    var subject: [String]
}

class SectionViewController: UIViewController, PassableData {
    @IBOutlet weak var TODOTableView: UITableView!
    @IBOutlet var TODOTableViewDataSource: TODOTableViewDataSource!
    @IBOutlet weak var sectionTitle: UILabel!
    @IBOutlet weak var TODOCount: UILabel!
    @IBOutlet weak var addButton: UIButton!
    private var sectionMode: Mode?
    
    // 메인 ViewController에서 바인딩 해야 합니다.
    private var status = Status(subject: ["Hello", "World", "HaHaHa"])
    private var doingStatus = Status(subject: ["이거", "되면", "대박"])
    
    var changeClosure: (() -> ())?
    
    @objc func valueChanged() {
        changeClosure?()
    }
    
    @IBAction func tapAddButton(_ sender: UIButton) {
        let addView = self.storyboard?.instantiateViewController(withIdentifier: "AddView") as! AddTODOViewController
        addView.modalPresentationStyle = .overCurrentContext
        addView.setSectionMode(mode: .completeTODO)
        present(addView, animated: false, completion: nil)
    }
    
    func bind(to observable: TextObservable<Status>) {
        //MARK: Add observer 위치 -> 사실 필요없음 ViewModel 쪽에서 옵저빙 해야함
        changeClosure = { [weak self] in
            observable.changeValue(to: self?.status ?? Status(subject: []))
        }
        
        observable.changeClosure = { [weak self] value in
            self?.status = value ?? Status(subject: [])
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.TODOTableViewDataSource.dataSource = self
    }
    
    func passData() -> Status {
        switch sectionMode {
        case .doingTODO:
            return doingStatus
        default:
            return status
        }
    }
    
    func setSectionMode(mode: Mode) {
        self.sectionMode = mode
    }
}


