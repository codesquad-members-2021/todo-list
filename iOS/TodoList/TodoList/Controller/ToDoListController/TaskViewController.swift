//  Created by 김지선 on 2021/04/07.


import UIKit

class TaskViewController: UIViewController {

    private var titleText: String?
    private var contentText: String?
    private var taskCount = 0

    var taskTableView: UITableView!
    var TaskCountLabel: TaskCountLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemGray6
        setUpNotification()
        taskTableView.delegate = self
        taskTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    

    private func setUpNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(getTextInfo), name: .addTextFieldText, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(addTaskCount), name: .addTextFieldText, object: nil)
    }
}

//MARK: -@objc Action
extension TaskViewController {
    
    @objc private func getTextInfo(_ notification: Notification) {
        titleText = notification.userInfo?["title"] as? String
        contentText = notification.userInfo?["content"] as? String
    }
    
    @objc private func addTaskCount() {
        taskCount += 1
        TaskCountLabel.text = String(taskCount)
        taskTableView.insertRows(at: [IndexPath(row: taskCount-1, section: 0)], with: .automatic)
    }
}

//MARK: @TableViewCell
extension TaskViewController: UITableViewDataSource, UITableViewDelegate  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskTableViewCell
        cell.titleTextLabel.text = titleText
        cell.contentTextLabel.text = contentText
        return cell
    }
}

//MARK: @IBAction

extension TaskViewController {
    @IBAction func addTaskButton(_ sender: Any) {
    }
}
