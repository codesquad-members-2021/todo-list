//
//  ColumnViewController.swift
//  ToDoListApp
//
//  Created by 박정하 on 2021/04/07.
//

import UIKit

class ColumnViewController : UIViewController{
    @IBOutlet weak var columnTitle: UILabel!
    @IBOutlet weak var columnTableView: UITableView!
    private let columnDataSource : ColumnDataSource//원하시면 변수명 변경하셔도 됩니당
    private let columnDelegate : ColumnDelegate //일단은 뷰컨 - 뷰 일대일 대응 방식으로 코드 구성해놓을게요
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        columnDataSource = ColumnDataSource.init(columnidentifier: CellIdentifiers.column1.rawValue, datamanager: ColumnDatas())
        columnDelegate = ColumnDelegate.init()
        columnTableView.delegate = columnDelegate
        columnTableView.dataSource = columnDataSource
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        columnDataSource = ColumnDataSource.init(columnidentifier: CellIdentifiers.column1.rawValue, datamanager: ColumnDatas())
        columnDelegate = ColumnDelegate.init()
        columnTableView.delegate = columnDelegate
        columnTableView.dataSource = columnDataSource
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
