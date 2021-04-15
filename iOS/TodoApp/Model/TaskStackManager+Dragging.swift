import UIKit
import MobileCoreServices

extension TaskStackManager {
    
    func canHandle(_ session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass: NSString.self)
    }
    
    func dragItems(for indexPath: IndexPath, stauts: Int) -> [UIDragItem] {
        let taskCard = index(stauts, at: indexPath.row)
        let itemProvider = NSItemProvider(object: taskCard)
        let dragItem = UIDragItem(itemProvider: itemProvider)
//        itemProvider.registerDataRepresentation(forTypeIdentifier: kUTTypePlainText as String, visibility: .all) { completion in
//            completion(data, nil)
//            return nil
//        }
        return [dragItem]
    }
}
