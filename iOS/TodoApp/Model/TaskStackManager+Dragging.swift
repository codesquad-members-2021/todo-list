import UIKit
import MobileCoreServices

extension TaskStackManager {
    
    func canHandle(_ session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass: TaskCard.self)
    }
    
    func dragItems(for indexPath: IndexPath, stauts: Int) -> [UIDragItem] {
        let dragCard = index(stauts, at: indexPath.row)
        let itemProvider = NSItemProvider(object: dragCard)
        let dragItem = UIDragItem(itemProvider: itemProvider)
        return [dragItem]
    }
}
