//  Created by 김지선 on 2021/04/07.


import UIKit

class ToDoViewController: UIViewController {

    private var titleView = TitleLabelView()
    private var taskTableView = UITableView()
    
    private var titleText: String?
    private var contentText: String?
    private var taskCount = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainVeiw()
        setUpNotification()
        taskTableView.delegate = self
        taskTableView.dataSource = self
        taskTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    

}

//MARK: -@objc Action
extension ToDoViewController {
    
    @objc private func getTextInfo(_ notification: Notification) {
        titleText = notification.userInfo?["title"] as? String
        contentText = notification.userInfo?["content"] as? String
    }
    
    @objc private func addTaskCount() {
        taskCount += 1
        titleView.taskCountLabel.text = String(taskCount)
        taskTableView.insertRows(at: [IndexPath(row: taskCount-1, section: 0)], with: .automatic)
    }
    
    @objc private func moveToViewController() {
        let addCardViewController = storyboard!.instantiateViewController(identifier: "NewTaskViewController")
        //addCardViewController.modalPresentationStyle = .fullScreen
        present(addCardViewController, animated: true, completion: nil)
    }
}

//MARK: -@TableViewCell
extension ToDoViewController: UITableViewDataSource, UITableViewDelegate  {
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

//MARK: -Action

extension ToDoViewController {
    
    private func addTaskCardButton() {
        titleView.addTaskCardButton.addTarget(self, action: #selector(moveToViewController), for: .touchUpInside)
    }
}

//MARK: -SettingViews

extension ToDoViewController {
    
    private func setupMainVeiw() {
        view.backgroundColor = UIColor.systemGray6
        setupTitleLabelView()
        addTaskCardButton()
    }
    
    private func setUpNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(getTextInfo), name: .addTextFieldText, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(addTaskCount), name: .addTextFieldText, object: nil)
    }
    
    private func setupTitleLabelView() {
        view.addSubview(titleView)
        titleView.widthAnchor.constraint(equalToConstant: view.layer.bounds.width).isActive = true
        titleView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
