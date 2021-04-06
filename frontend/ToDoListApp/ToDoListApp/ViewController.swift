//
//  ViewController.swift
//  ToDoListApp
//
//  Created by 이다훈 on 2021/04/06.
//

import UIKit

class ViewController: UIViewController {
    let topSectionView : TopSectionView
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        topSectionView = TopSectionView.init(frame: CGRect(x: 0, y: 0, width: 1194, height: 72))
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        topSectionView = TopSectionView.init(frame: CGRect(x: 0, y: 0, width: 1194, height: 72))
        super.init(coder: coder)    }

    override func viewWillAppear(_ animated: Bool) {
        setSubViews()
        super.viewWillAppear(false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController{
    
    private func setSubViews(){
        self.view.addSubview(topSectionView)
        topSectionView.translatesAutoresizingMaskIntoConstraints = false
        //topSectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
    }
}
