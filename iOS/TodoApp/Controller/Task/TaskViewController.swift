//  Created by 김지선 on 2021/04/08.
import UIKit

class TaskViewController: UIViewController {

    var column: Int?
    let taskStackManager = TaskStackManager()
    var selectedCell: TaskCell!
    var selectedIndexPath: IndexPath!

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var taskCountLabel: UILabel!
    @IBOutlet weak var taskTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
        addNotificationObserver()
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longTouched(_:)))
        longPressGesture.minimumPressDuration = 0.3
        longPressGesture.isEnabled = true
        taskTableView.addGestureRecognizer(longPressGesture)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == StatusInfo.addTask {
            if let newTaskViewController = segue.destination as? NewTaskViewController {
                newTaskViewController.column = self.column
            }
        }
    }
    func updateTaskCountLabel() {
        let count = taskStackManager.arrayCount()
        taskCountLabel.text = "\(count[column!])"
        taskTableView.reloadData()
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
        guard let id = column else { return }
        let titles = TitleList.ofStatus
        titleLabel.text = titles[id]
    }
    
    private func setupTaskCountLable() {
        taskCountLabel.layer.cornerRadius = taskCountLabel.layer.bounds.width / 2.25
        taskCountLabel.layer.masksToBounds = true
    }
    
    //Register Xib
    private func registerTaskCell() {
        taskTableView.register(UINib(nibName: CustomCell.task, bundle: nil), forCellReuseIdentifier: CustomCell.task)
    }
}

//MARK: -Notification
extension TaskViewController {
    func addNotificationObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(insertTask(_:)), name: .addTask, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(drawTaskCard(_:)), name: .requestSetupTask, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(sendRemovedData(_:)), name: .requestRemoveTask, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(sendMovedData(_:)), name: .requestMoveTask, object: nil)
    }
    
    @objc func drawTaskCard(_ notification: Notification) {
        let card = notification.userInfo?["taskCard"] as! TaskCard
        let status = card.status
        taskStackManager.append(status, taskCard: card)
        updateTaskCountLabel()
    }
    
    @objc func insertTask(_ notification: Notification) {
        let (status, title, content) = (notification.userInfo?["column"] as? Int ?? 0,
                                        notification.userInfo?["title"] as? String ?? "",
                                        notification.userInfo?["content"] as? String ?? "")
        let id = taskStackManager.totalCount() + 1
        let card = TaskCard(id: id, title: title, content: content, createdAt: "\(Date())", status: status, author: "user1")
        taskStackManager.append(status, taskCard: card)
        updateTaskCountLabel()
        if column == card.status {
            NetworkManager.insertedDataPost(httpMethod: HTTPMethod.post, data: card)
        }
    }
    
    @objc func sendRemovedData(_ notification: Notification) {
        let removedData = notification.userInfo?["removedData"] as! TaskCard
        updateTaskCountLabel()
        NetworkManager.changedDataPost(httpMethod: HTTPMethod.delete, data: removedData)
    }
    
    @objc func sendMovedData(_ notification: Notification) {
        var movedData = notification.userInfo?["movedData"] as! TaskCard
        if column == StatusValue.done {
            movedData.status = StatusValue.done
            taskStackManager.append(StatusValue.done, taskCard: movedData)
        }
        updateTaskCountLabel()
        NetworkManager.changedDataPost(httpMethod: HTTPMethod.post, data: movedData)
    }
}
   
