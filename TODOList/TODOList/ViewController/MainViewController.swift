//
//  ViewController.swift
//  TODOList
//
//  Created by Issac on 2021/04/06.
//

import UIKit

class MainViewController: UIViewController {
    enum Segues {
        static let willTODO = "WillTODO"
        static let doingTODO = "DoingTODO"
        static let completeTODO = "CompleteTODO"
    }
    var menuView: UIView!
    var closeButton: UIButton!
    var menuTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeMenuView()
        self.makeTableView()
        self.setConstraintOfTableView()
        self.setCloseButton()
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
    
    @IBAction func touchSideMenuButton(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
            self.menuView.frame.origin.x = self.view.frame.maxX * 0.65
        }
    }
    
    @objc func closeMenuView() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
            self.menuView.frame.origin.x = self.view.frame.maxX
        }
    }
    
    private func makeMenuView() {
        self.menuView = UIView()
        self.menuView.backgroundColor = .white
        self.menuView.frame.size.width = self.view.frame.width * 0.35
        self.menuView.frame.size.height = self.view.frame.height
        self.menuView.frame.origin.x = self.view.frame.maxX
        self.view.addSubview(self.menuView)
    }
    
    private func makeTableView() {
        self.menuTableView = UITableView()
        self.menuTableView = UITableView(frame: CGRect(x: 40, y: 60, width: self.view.frame.width * 0.3 - 60, height: self.view.frame.height))
        self.menuTableView.separatorStyle = .none
        self.menuTableView.allowsSelection = false
        self.menuTableView.dataSource = self
        self.menuTableView.delegate = self
        
        let nibName = UINib(nibName: "HistoryCell", bundle: nil)
        self.menuTableView.register(nibName, forCellReuseIdentifier: "historyCell")
        self.menuView.addSubview(self.menuTableView)
    }
    
    private func setConstraintOfTableView() {
        self.menuTableView.translatesAutoresizingMaskIntoConstraints = false
        self.menuTableView.topAnchor.constraint(equalTo: self.menuView.topAnchor, constant: 60).isActive = true
        self.menuTableView.bottomAnchor.constraint(equalTo: self.menuView.bottomAnchor, constant: 0).isActive = true
        self.menuTableView.leadingAnchor.constraint(equalTo: self.menuView.leadingAnchor, constant: 40).isActive = true
        self.menuTableView.trailingAnchor.constraint(equalTo: self.menuView.trailingAnchor, constant: 40).isActive = true
    }
    
    private func setCloseButton() {
        guard let largeBold = UIImage(systemName: "xmark") else { return }
        self.closeButton = UIButton(frame: CGRect(x: self.menuView.frame.width - 50.75, y: 30.75, width: 40, height: 40))
        self.closeButton.tintColor = .black
        self.closeButton.setImage(largeBold, for: .normal)
        self.closeButton.addTarget(self, action: #selector(closeMenuView), for: .touchUpInside)
        
        self.menuView.addSubview(self.closeButton)
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath) as? HistoryCell else { return HistoryCell() }
        cell.contents.sizeToFit()
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
}


