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
    
    private let columnDataSource = ColumnDataSource(datamanager: ColumnDatas())//원하시면 변수명 변경하셔도 됩니당
    private let columnDelegate = ColumnDelegate() //일단은 뷰컨 - 뷰 일대일 대응 방식으로 코드 구성해놓을게요
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
}
