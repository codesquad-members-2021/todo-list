//
//  TaskViewControllerExtension.swift
//  Todo_List
//
//  Created by jinseo park on 4/8/21.
//


import MobileCoreServices
import UIKit

extension TaskViewController : UITableViewDragDelegate, UITableViewDropDelegate {
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        
        //ex = "해야 할 일" 에서 순서대로 [0,0], [1,0], [2,0]
        print("PickUP",#function, tableView.numberOfSections, session, indexPath)
        //아직은 전달할 데이터 인자가 없다.
        
//        let placeName = placeNames[indexPath.row]
//        let data = placeName.data(using: .utf8)
//        let itemProvider = NSItemProvider()
        
        guard let data = "hello".data(using: .utf8) else { return [] }
        let itemProvider = NSItemProvider(item: data as NSData, typeIdentifier: kUTTypePlainText as String?)
        let dragItem = UIDragItem(itemProvider: itemProvider)
        dragItem.localObject = tableView
        
//        self.todoTasks.remove(at: 0)
//        self.todo.reloadData()
        
        return [dragItem]
        
    }
    
//    func tableView(_ tableView: UITableView, dragSessionWillBegin session: UIDragSession) {
//        print(#function, tableView.numberOfSections )
//    }
//    
//    func tableView(_ tableView: UITableView, dropSessionDidEnter session: UIDropSession) {
//        print(#function, tableView.numberOfSections )
//    }
    
    
    /*Available multiple items drag*/
    
    public func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
        let destinationIndexPath: IndexPath
//        
//        guard let draggedItems = coordinator.session.localDragSession?.items else {
//            return
//        }
//        let localObjects = draggedItems.compactMap { return $0.localObject}
//        
//        if let indexPath = coordinator.destinationIndexPath{
//            destinationIndexPath = indexPath
//        } else {
//            // 테이블뷰의 마지막 인덱스를 가져온다
//            //let section = tableView.numberOfSections - 1
//            //let row = tableView.numberOfRows(inSection: section)
//            destinationIndexPath = IndexPath(row: 0, section: 0)
//        }
//        //print("indexPath:  \(indexPath)")
//        
//        print("destinationIndexPath \(destinationIndexPath)")
//        var indexPaths = [IndexPath]()
//        for (index, _) in localObjects.enumerated() {
//            let indexPath = IndexPath(row: destinationIndexPath.row + index, section: destinationIndexPath.section)
//            
//            let new = TaskVO()//현재는 드랍 시에 새로운 것을 넣는다.
////            new.
//            switch tableView {
//            case self.todo:
//                self.todoTasks.insert(new, at: 0)
//                self.todo.reloadData()
//            case self.doing:
//                self.doingTasks.insert(new, at: 0)
//                self.doing.reloadData()
//            case self.done:
//                self.doneTasks.insert(new, at: 0)            
//                self.done.reloadData()
//            default:
//                break
//            }
//
//            indexPaths.append(indexPath)
//        }
        
        tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
}
