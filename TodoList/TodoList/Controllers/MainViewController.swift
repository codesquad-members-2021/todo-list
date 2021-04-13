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
    
    private let doDelegate = DoDelegate()
    private let doingDelegate = DoingDelegate()
    private let doneDelegate = DoneDelegate()
    
    private let doDragDelegate = DoDragDelegate()
    private let doingDragDelegate = DoingDragDelegate()
    private let doneDragDelegate = DoneDragDelegate()
    
    private let doDropDelegate = DoDropDelegate()
    private let doingDropDelegate = DoingDropDelegate()
    private let doneDropDelegate = DoneDropDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityTrailingConstraint.constant -= activityView.frame.width
        setDelegateHandler()
    }

    func setDelegateHandler() {
        guard let storyboard = storyboard else { return }
        
        doDelegate.handler = { title, contents in
            guard let vc = Router.shared.route(storyboard, title: title, contents: contents) else {
                return
            }
            self.present(vc, animated: true, completion: nil)
        }
        
        doingDelegate.handler = { title, contents in
            guard let vc = Router.shared.route(storyboard, title: title, contents: contents) else {
                return
            }
            self.present(vc, animated: true, completion: nil)
        }
        
        doneDelegate.handler = { title, contents in
            guard let vc = Router.shared.route(storyboard, title: title, contents: contents) else {
                return
            }
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? TaskViewController else { return }
        switch segue.identifier {
        case "ToDo":
            vc.dataSource = doDataSource
            vc.delegate = doDelegate
            vc.dragDelegate = doDragDelegate
            vc.dropDelegate = doDropDelegate
        case "Doing":
            vc.dataSource = doingDataSource
            vc.delegate = doingDelegate
            vc.dragDelegate = doingDragDelegate
            vc.dropDelegate = doingDropDelegate
        case "Done":
            vc.dataSource = doneDataSource
            vc.delegate = doneDelegate
            vc.dragDelegate = doneDragDelegate
            vc.dropDelegate = doneDropDelegate
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
