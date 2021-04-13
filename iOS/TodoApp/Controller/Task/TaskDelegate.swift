import UIKit

extension TaskViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            // remove the item from the data model
            taskStackManager.remove(id!, at: indexPath.row)
            // delete the table view row
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
