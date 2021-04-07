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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        columnTableView.delegate = columnDelegate
        columnTableView.dataSource = columnDataSource
    }
}
