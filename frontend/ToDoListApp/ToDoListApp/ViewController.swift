//
//  ViewController.swift
//  ToDoListApp
//
//  Created by 이다훈 on 2021/04/06.
//

import UIKit

class ViewController: UIViewController {
    private let topSectionView : TopSectionView
    private let columnViewController : ColumnViewController
    //private let column1 : Column
    private let column2 : Column
    private let column3 : Column
    private let column1Delegate : ColumnDelegate = ColumnDelegate()
    private let column1DataSource : ColumnDataSource = ColumnDataSource(columnidentifier: CellIdentifiers.column1.rawValue, datamanager: ColumnDatas())
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        topSectionView = TopSectionView.init(frame: CGRect(x: 0, y: 0, width: 1194, height: 72))
        columnViewController = ColumnViewController.init()
        //column1 =  Column.init(frame: CGRect(x: 48, y: 123, width: 256, height: 294), Cellidentifier: CellIdentifiers.column1.rawValue, HeaderTitle: "해야할 일")
        column2 =  Column.init(frame: CGRect(x: 328, y: 123, width: 256, height: 294), Cellidentifier: CellIdentifiers.column1.rawValue, HeaderTitle: "하고 있는 일")
        column3 =  Column.init(frame: CGRect(x: 608, y: 123, width: 256, height: 294), Cellidentifier: CellIdentifiers.column1.rawValue, HeaderTitle: "완료한 일")
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        topSectionView = TopSectionView.init(frame: CGRect(x: 0, y: 0, width: 1194, height: 72))
        //column1 =  Column.init(frame: CGRect(x: 48, y: 123, width: 256, height: 294), Cellidentifier: CellIdentifiers.column1.rawValue, HeaderTitle: "해야할 일")
        column2 =  Column.init(frame: CGRect(x: 328, y: 123, width: 256, height: 294), Cellidentifier: CellIdentifiers.column1.rawValue, HeaderTitle: "하고 있는 일")
        column3 =  Column.init(frame: CGRect(x: 608, y: 123, width: 256, height: 294), Cellidentifier: CellIdentifiers.column1.rawValue, HeaderTitle: "완료한 일")
        columnViewController = ColumnViewController.init()
        super.init(coder: coder)
    }

    override func viewWillAppear(_ animated: Bool) {
        setSubViews()
        setDelegateDatasource()
        super.viewWillAppear(false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController{
    
    private func setSubViews(){
        self.view.addSubview(topSectionView)
        //self.view.addSubview(column1)
        self.view.addSubview(column2)
        self.view.addSubview(column3)
    }
    
    private func setDelegateDatasource(){
        //self.column1.delegate = column1Delegate
        //self.column1.dataSource = column1DataSource
    }
}
