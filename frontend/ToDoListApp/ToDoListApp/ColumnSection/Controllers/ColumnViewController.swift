//
//  ColumnViewController.swift
//  ToDoListApp
//
//  Created by 박정하 on 2021/04/07.
//

import UIKit

class ColumnViewController : UIViewController {
    @IBOutlet weak var columnTitle: UILabel!
    @IBOutlet weak var columnTableView: UITableView!
    
    private let columnDataSource = ColumnDataSource(datamanager: ColumnDatas())
    private let columnDelegate = ColumnDelegate()
    func set(title: String){
        guard let tempTitle = columnTitle else {return}
        tempTitle.text = title
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard columnTableView != nil else {return}
        columnTableView.delegate = columnDelegate
        columnTableView.dataSource = columnDataSource
        columnTableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
    }
    
    override func viewLayoutMarginsDidChange() {
    }
    
    @IBAction func addCardButton(_ sender: Any) {
        guard let tempVC : UIViewController = storyboard?.instantiateViewController(withIdentifier: "newCard") else {return}
        tempVC.view.isOpaque = false
        tempVC.preferredContentSize = CGSize(width: 400, height: 175)
        tempVC.modalPresentationStyle = .formSheet
        present(tempVC, animated: true, completion: nil)
    }
}
