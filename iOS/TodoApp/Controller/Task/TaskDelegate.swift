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
        cell.becomeFirstResponder()
        let contextMenu = UIContextMenuInteraction(delegate: self)
        cell.addInteraction(contextMenu)
    }
    
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) {_ in

            let edit = UIAction(title: StatusInfo.edit, image: UIImage(systemName: "pencil.tip")) { _ in
                print(self.column!)
                let editCard = self.taskStackManager.index(self.column!, at: self.selectedIndexPath.row)
                let editViewController = EditViewController()
                editViewController.modalPresentationStyle = .overCurrentContext
                editViewController.setUpInfo(status: self.column!, index: self.selectedIndexPath.row, titleText: editCard.title, contentText: editCard.content)
                self.present(editViewController, animated: true, completion: nil)
            }
            
            let moveToDone = UIAction(title: StatusInfo.moveToDone, image: UIImage(systemName: "arrow.right")) { _ in
                if self.column != StatusValue.done {
                    self.taskStackManager.move(self.column!, at: self.selectedIndexPath.row)
                }
            }
            
            let delete = UIAction(title: StatusInfo.delete, image: UIImage(systemName: "trash"), attributes: .destructive ) { _ in
                self.taskStackManager.remove(self.column!, at: self.selectedIndexPath.row)
            }
            return UIMenu(children: [edit, moveToDone, delete])
        }
    }
}
