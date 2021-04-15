import UIKit

extension TaskViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {

            taskStackManager.remove(column!, at: indexPath.row)
            updateTaskCountLabel()
        }
    }
    
    func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

extension TaskViewController: UIContextMenuInteractionDelegate {
    
    @objc func longTouched(_ gesture: UIGestureRecognizer) {
        let touchedPoint = gesture.location(in: taskTableView)
        guard let indexPath = self.taskTableView.indexPathForRow(at: touchedPoint) else { return }
        let cell = self.taskTableView.cellForRow(at: indexPath) as! TaskCell
        self.selectedIndexPath = indexPath
        self.selectedCell = cell
        cell.becomeFirstResponder()
        let contextMenu = UIContextMenuInteraction(delegate: self)
        cell.addInteraction(contextMenu)
    }
    
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) {_ in

            let edit = UIAction(title: "Edit", image: UIImage(systemName: "pencil.tip")) { _ in
                // edit func
            }
            
            let moveToDone = UIAction(title: "Move To Done", image: UIImage(systemName: "arrow.right")) { _ in
                if self.column != StatusValue.done {
                    self.taskStackManager.move(self.column!, at: self.selectedIndexPath.row)
                }
            }
            
            let delete = UIAction(title: "Delete", image: UIImage(systemName: "trash"), attributes: .destructive ) { _ in
                self.taskStackManager.remove(self.column!, at: self.selectedIndexPath.row)
            }
            return UIMenu(children: [edit, moveToDone, delete])
        }
    }
}
