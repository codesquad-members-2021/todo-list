//
//  TaskViewController+Drop.swift
//  Todo_List
//
//  Created by 박혜원 on 2021/04/09.
//

import UIKit

extension CardViewController : UITableViewDropDelegate {
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
        
        //        print("coordinator",coordinator)
        //guard let dragItems = coordinator.session.localDragSession?.items else {
        //        coordinator.session.loadObjects(ofClass: NSString.self)  { item in
        //
        //            print(item)
        //
        //        }
        
        for item in coordinator.items {
            item.dragItem.itemProvider.loadObject(ofClass: Card.self, completionHandler: { (card, error) in
                if let card = card as? Card {
                    //Here is your your custom object
                    print("card",card.content,card.title,card.writer)
                }
            })
            
            
            
            
            /*
             // attempt to load strings from the drop coordinator
             coordinator.session.loadObjects(ofClass: NSString.self) { items in
             // convert the item provider array to a string array or bail out
             guard let strings = items as? [String] else { return }
             
             // create an empty array to track rows we've copied
             var indexPaths = [IndexPath]()
             
             // loop over all the strings we received
             for (index, string) in strings.enumerated() {
             // create an index path for this new row, moving it down depending on how many we've already inserted
             let indexPath = IndexPath(row: destinationIndexPath.row + index, section: destinationIndexPath.section)
             
             // insert the copy into the correct array
             if tableView == self.leftTableView {
             self.leftItems.insert(string, at: indexPath.row)
             } else {
             self.rightItems.insert(string, at: indexPath.row)
             }
             
             // keep track of this new row
             indexPaths.append(indexPath)
             }
             
             // insert them all into the table view at once
             tableView.insertRows(at: indexPaths, with: .automatic)
             }
             */
            
            
            //        print("dragItems", dragItems.)
            
            
            
            
            
            //        let localObjects = draggedItems.compactMap { return $0.localObject as? Card }
            
            //        print("localObjects =",localObjects)
            //        if let indexPath = coordinator.destinationIndexPath{
            //            destinationIndexPath = indexPath
            //
            //        let destinationIndexPath: IndexPath
            //        if let indexPath = coordinator.destinationIndexPath {
            //            destinationIndexPath = indexPath
            //        } else {
            //            let section = tableView.numberOfSections - 1
            //            let row = tableView.numberOfRows(inSection: section)
            //            destinationIndexPath = IndexPath(row: row, section: section)
            //        }
            
            
        }
    }
}
