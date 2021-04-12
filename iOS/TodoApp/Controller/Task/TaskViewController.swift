//  Created by 김지선 on 2021/04/08.
import UIKit

class TaskViewController: UIViewController {

    var id: Int?

    let taskStackManager = TaskStackManager()
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var taskCountLabel: UILabel!
    @IBOutlet weak var taskTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
        addNotificationObserver()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == StatusInfo.addTask {
            if let newTaskViewController = segue.destination as? NewTaskViewController {
                newTaskViewController.id = self.id
            }
        }
        
        //
    }
}

//MARK: -SetUp && Configure
extension TaskViewController {
    
    private func setupSubViews() {
        setupTitleLabel()
        setupTaskCountLable()
        registerTaskCell()
    }
    
    // Custom
    private func setupTitleLabel() {
        guard let id = id else { return }
        let titles = TitleList.ofStatus
        titleLabel.text = titles[id]
    }
    
    private func setupTaskCountLable() {
        taskCountLabel.layer.cornerRadius = taskCountLabel.layer.frame.width / 2
        taskCountLabel.layer.masksToBounds = true
    }
    
    //Register Xib
    private func registerTaskCell() {
        taskTableView.register(UINib(nibName: "TaskCell", bundle: nil), forCellReuseIdentifier: "TaskCell")
    }
}

//MARK: -Notification
extension TaskViewController {
    func addNotificationObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(insertTask(_:)), name: .addTask, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(drawTaskCard(_:)), name: .setupTask, object: nil)
    }
    
    @objc func drawTaskCard(_ notification: Notification) {
        let card = notification.userInfo?["taskCard"] as! TaskCard
        let status = card.status
        taskStackManager.tasks[status].append(taskCard: card)
        let count = taskStackManager.arrayCount()
        taskCountLabel.text = "\(count[id!])"
        taskTableView.reloadData()
    }
    
    @objc func insertTask(_ notification: Notification) {
        //나중에 구현
    }
}

/*
 [1, 2, 3]
 
 if status == 1 {
    tableview[1] = 배열[1]
 }
 */
