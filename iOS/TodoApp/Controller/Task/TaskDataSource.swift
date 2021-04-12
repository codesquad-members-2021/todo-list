import UIKit

extension TaskViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskStackManager.count(id!)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as? TaskCell
        let taskCard = taskStackManager.index(id ?? 0, at: indexPath.row)
        
        cell?.titleTextLabel.text = taskCard.title
        cell?.contentTextLabel.text = taskCard.content
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            // remove the item from the data model
//            taskStack.remove(at: indexPath.row)
            
            // delete the table view row
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
//        } else if editingStyle == .insert {
//            // Not used in our example, but if you were adding a new row, this is where you would do it.
//        }
    }
    
    func addNotificationObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(insertTask(_:)), name: .addTask, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: <#T##Selector#>, name: .setupTask, object: nil)
    }
    
    @objc func insertTask(_ notification: Notification) {
//        taskStack += 1
//        titleText = notification.userInfo?["title"] as? String
//        contentText = notification.userInfo?["content"] as? String
//        print(notification.userInfo?["id"])
//        
//        taskTableView.insertRows(at: [IndexPath(row: taskCount-1, section: 0)], with: .automatic)
    }
    
    @objc func
}

