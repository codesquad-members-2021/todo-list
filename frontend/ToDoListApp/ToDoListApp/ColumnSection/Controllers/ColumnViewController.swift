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
    
    private let cellDataManager : DataManager
    private let columnDataSource : ColumnDataSource
    private let columnDelegate : ColumnDelegate
    private var currentModalViewController : ModalViewController? = nil //3개의 뷰컨이 모두 응답하여서 현재 띄운 뷰 컨트롤러가 누구인지 구분하기 위함

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?){
        self.cellDataManager = ColumnDatas()
        self.columnDelegate = ColumnDelegate()
        self.columnDataSource = ColumnDataSource.init(datamanager: cellDataManager)
        super.init(nibName: nil, bundle: nil)
        columnTableView.estimatedRowHeight = 108
        columnTableView.rowHeight = UITableView.automaticDimension
    }
    
    required init?(coder: NSCoder) {
        self.cellDataManager = ColumnDatas()
        self.columnDelegate = ColumnDelegate()
        self.columnDataSource = ColumnDataSource.init(datamanager: cellDataManager)
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewInit()
//        columnTableView.estimatedRowHeight = 108
//        columnTableView.rowHeight = UITableView.automaticDimension
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        
    }
    
    override func viewLayoutMarginsDidChange() {
        
    }
    
    @IBAction func addCardButton(_ sender: Any) {
        guard let tempVC : ModalViewController = storyboard?.instantiateViewController(withIdentifier: "newCard") as? ModalViewController else {return}
        tempVC.view.isOpaque = false
        tempVC.preferredContentSize = CGSize(width: 400, height: 175)
        tempVC.modalPresentationStyle = .formSheet
        present(tempVC, animated: true, completion: nil)
        currentModalViewController = tempVC
    }
    
    func set(title: String){
        guard let tempTitle = columnTitle else {return}
        tempTitle.text = title
    }
    
    @objc private func addCard(sender: Notification){
        guard let currentModalVC = currentModalViewController else { return }
        cellDataManager.add(cellData: currentModalVC.makeCellData())
        columnTableView.insertSections(IndexSet(integer: columnTableView.numberOfSections), with: .automatic)
        print(cellDataManager.currentDatasCount())
        currentModalVC.set(active: false)
        self.currentModalViewController = nil
    }
    
}

extension ColumnViewController {
    
    func viewInit(){
        guard columnTableView != nil else {return}
        columnTableView.delegate = columnDelegate
        columnTableView.dataSource = columnDataSource
        columnTableView.reloadData()
        
        NotificationCenter.default.addObserver(self, selector: #selector(addCard), name: NSNotification.Name("addCard"), object: currentModalViewController)
    }
}
