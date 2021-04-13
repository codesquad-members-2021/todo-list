import UIKit

extension TaskViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskStackManager.count(column!)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as? TaskCell
        let taskCard = taskStackManager.index(column ?? 0, at: indexPath.row)
        
        cell?.titleTextLabel.text = taskCard.title
        cell?.contentTextLabel.text = taskCard.description
        
        return cell!
    }
}
