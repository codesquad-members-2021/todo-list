//
//  TODOTableViewDataSource.swift
//  TODOList
//
//  Created by Issac on 2021/04/06.
//

import UIKit
import Combine

class TODOTableViewDataSource: NSObject {
    var changeClosure: (() -> ())?
    private var subject: [String]
    private var body: [String]
    private var author: [String]
    
    override init() {
        self.subject = [String]()
        self.body = [String]()
        self.author = [String]()
    }
    
    @objc func valueChanged() {
        changeClosure?()
    }
    
    func bind(to observable: TextObservable<[String]>) {
        //MARK: Add observer 위치
        changeClosure = { [weak self] in
            observable.changeValue(to: self?.subject ?? [String]())
        }
        
        observable.changeClosure = { [weak self] value in
            self?.subject = value ?? [String]()
        }
    }
}


extension TODOTableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subject.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SectionCell.identifier, for: indexPath) as? SectionCell else { return UITableViewCell() }
        cell.subject.text = subject[indexPath.row]
        return cell
    }
}
