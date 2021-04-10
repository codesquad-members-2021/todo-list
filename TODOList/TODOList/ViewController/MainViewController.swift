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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMenuView()
    }
    
    //MARK:TestAndTest
    func setMenuView() {
        self.menuView = UIView()
        self.menuView.backgroundColor = .white
        self.menuView.frame.size.width = self.view.frame.width * 0.3
        self.menuView.frame.size.height = self.view.frame.height
        self.menuView.frame.origin.x = self.view.frame.maxX
        
        
        var tableView = UITableView()
        tableView = UITableView(frame: CGRect(x: 30, y: 60, width: self.view.frame.width * 0.3 - 60, height: self.view.frame.height))
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        
        tableView.rowHeight = 137
        let nibName = UINib(nibName: "HistoryCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: HistoryCell.identifier)
        
        self.menuView.addSubview(tableView)
        
        guard let largeBold = UIImage(systemName: "xmark") else { return }
        self.closeButton = UIButton(frame: CGRect(x: self.menuView.frame.width - 50.75, y: 30.75, width: 40, height: 40))
        self.closeButton.tintColor = .black
        self.closeButton.setImage(largeBold, for: .normal)
        self.closeButton.addTarget(self, action: #selector(closeMenuView), for: .touchUpInside)
        self.view.addSubview(self.menuView)
        self.menuView.addSubview(self.closeButton)
        
        tableView.dataSource = self
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
            self.menuView.frame.origin.x = self.view.frame.maxX * 0.7
        }
    }
    
    @objc func closeMenuView() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
            self.menuView.frame.origin.x = self.view.frame.maxX
        }
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryCell.identifier) as! HistoryCell
        return cell
    }

}


