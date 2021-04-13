//
//  MainViewController.swift
//  TodoList
//
//  Created by Ador on 2021/04/13.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var activityView: UIView!
    @IBOutlet weak var activityTrailingConstraint: NSLayoutConstraint!
    
    private let doDataSource = DoDataSource()
    private let doingDataSource = DoingDataSource()
    private let doneDataSource = DoneDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        activityTrailingConstraint.constant -= activityView.frame.width
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let vc = segue.destination as? TaskViewController else { return }
        switch segue.identifier {
        case "ToDo":
            vc.dataSource = doDataSource
        case "Doing":
            vc.dataSource = doingDataSource
        case "Done":
            vc.dataSource = doneDataSource
        default:
            print("break")
            break
        }
    }

    // MARK: - IBActions
    @IBAction func touchUpAdd(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "Add") as? AddViewController else {
            return
        }
        vc.status = .add
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func touchUpMenu(_ sender: Any) {
        activityTrailingConstraint.constant = 0
        UIView.animate(withDuration: 0.4) { [weak self] in
            self?.view.layoutIfNeeded()
        }
    }
    
    @IBAction func touchUpClose(_ sender: Any) {
        activityTrailingConstraint.constant -= activityView.frame.width
        UIView.animate(withDuration: 0.4) { [weak self] in
            self?.view.layoutIfNeeded()
        }
    }
}
