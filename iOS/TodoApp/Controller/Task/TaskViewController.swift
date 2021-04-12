//  Created by 김지선 on 2021/04/08.
import UIKit

class TaskViewController: UIViewController {

    var id: Int?

    var taskCount = 0 
    var titleText: String?
    var contentText: String?
    let taskStackManager = TaskStackManager()
    let taskStack = TaskStack()
    
    let cellReuseIdentifier = "TaskCell"
    let cellSpacingHeight: CGFloat = 10
    
    //test code
    var taskCards: [TaskCard] = [TaskCard(id: 0, status: StatusValue.toDo, title: "7시 기상", content: "알람 듣고 바로 기상"), TaskCard(id: 1, status: StatusValue.inProgress, title: "데일리 스크럼", content: "1팀")]
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var taskCountLabel: UILabel!
    @IBOutlet weak var taskTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
        addNotificationObserver()
        setupData()
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

extension TaskViewController {
    func setupData() {
        taskStack.append(taskCard: taskCards[0])
        taskStack.append(taskCard: taskCards[1])
    }
    
    
}

