//
//  TaskViewController+Data.swift
//  Todo_List
//
//  Created by 박혜원 on 2021/04/09.
//

import UIKit

// MARK:- delegation set up
extension CardViewController {
    func setUpDelegate(){
        todo.delegate = self
        todo.dataSource = self
//        todo.dragDelegate = self
//        todo.dropDelegate = self
//        todo.dragInteractionEnabled = true
        
        doing.delegate = self
        doing.dataSource = self
//        doing.dragDelegate = self
//        doing.dropDelegate = self
//        doing.dragInteractionEnabled = true

        done.delegate = self
        done.dataSource = self
//        done.dragDelegate = self
//        done.dropDelegate = self
//        done.dragInteractionEnabled = true
        
    }
}
extension CardViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CardViewConstant.numberOfRowsInSection //각 섹션에는 한개의 row만 존재한다.
    }
    /*섹션의 수를 늘리는 프로토콜*/
    func numberOfSections(in tableView: UITableView) -> Int {
        var count = 0
        switch tableView {
        case todo:
            count = board.todoList.count
            countOfTodo.text = String(count)
        case doing:
            count = board.doingList.count
            countOfDoing.text = String(count)
        case done:
            count = board.doneList.count
            countOfDone.text = String(count)
        default:
            break
        }
        return count
    }
    
    /*섹션의 헤더섹션 배경색을 바꾸는 법.*/
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.9607843137, alpha: 1)
    }
    
    /*섹션의 헤더섹션 사이즈를 늘리는 방법.*/
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CardViewConstant.heightForHeaderInSection
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CardCell") as! CardCell
        
        var card : Card
        switch tableView {
        case todo:
            card = board.todoList[indexPath.section]
        case doing:
            card = board.doingList[indexPath.section]
        case done:
            card = board.doneList[indexPath.section]
        default:
            return cell
        }
        cell.title.text = card.title
        cell.content.text = card.content
        cell.writer.text = card.writer
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     
        switch tableView {
        case todo:
            board.remove(at: indexPath.section, type: .todo)
//            todo.deleteSections([indexPath.section], with: .fade)
        case doing:
            board.remove(at: indexPath.section, type: .doing)
//            doing.deleteSections([indexPath.section], with: .fade)
        case done:
            board.remove(at: indexPath.section, type: .done)
//            done.deleteSections([indexPath.section], with: .fade)
        default:
            return
        }
    }
    
    /*각 테이블 내부에서 섹션을 변경할수 있는 프로토콜 */
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        print("sourceIndexPath : ",sourceIndexPath, "destinationIndexPath : ",destinationIndexPath)
        tableView.moveSection(sourceIndexPath.section, toSection: destinationIndexPath.section)
    }
}
