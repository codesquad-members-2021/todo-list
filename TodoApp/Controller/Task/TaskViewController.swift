//  Created by 김지선 on 2021/04/08.
import Foundation
import UIKit

class TaskViewController: UIViewController {

    var id: Int?
    private var taskCount = 0
    private var titleText: String?
    private var contentText: String?
    
    private let cellReuseIdentifier = "TaskCell"
    private let cellSpacingHeight: CGFloat = 10
    
    //test code
    var taskCards: [TaskCard] = [TaskCard(id: 0, status: StatusValue.toDo, title: "7시 기상", content: "알람 듣고 바로 기상"), TaskCard(id: 1, status: StatusValue.inProgress, title: "데일리 스크럼", content: "1팀")]
   

    
    
    //
    
    
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

extension TaskViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskCards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as? TaskCell
//        cell?.titleTextLabel.text = titleText
        cell?.titleTextLabel.text = taskCards[indexPath.row].title
//        cell?.contentTextLabel.text = contentText
        cell?.contentTextLabel.text = taskCards[indexPath.row].content
        
        return cell!
    }
    
    // method to run when table view cell is tapped
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("You tapped cell number \(indexPath.row).")
//    }
    
    // this method handles row deletion
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            // remove the item from the data model
            taskCards.remove(at: indexPath.row)
            
            // delete the table view row
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Not used in our example, but if you were adding a new row, this is where you would do it.
        }
    }
    
    private func addNotificationObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(insertTask(_:)), name: .addTask, object: nil)
    }
    
    @objc func insertTask(_ notification: Notification) {
        taskCount += 1
        titleText = notification.userInfo?["title"] as? String
        contentText = notification.userInfo?["content"] as? String
        print(notification.userInfo?["id"])
        
        taskTableView.insertRows(at: [IndexPath(row: taskCount-1, section: 0)], with: .automatic)
    }
}
