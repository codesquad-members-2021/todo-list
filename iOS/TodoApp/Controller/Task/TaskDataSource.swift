import UIKit

extension TaskViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskStackManager.count(column!)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.task, for: indexPath) as? TaskCell
        let taskCard = taskStackManager.index(column ?? 0, at: indexPath.row)
        cell?.titleTextLabel.text = taskCard.title
        cell?.contentTextLabel.text = taskCard.content
        cell?.iOSLabel.text = taskCard.author
        return cell!
    }
}
