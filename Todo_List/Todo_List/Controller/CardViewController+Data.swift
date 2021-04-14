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
        todo.dragDelegate = self
        todo.dropDelegate = self
        todo.dragInteractionEnabled = true
        todo.allowsSelectionDuringEditing = true
        
        doing.delegate = self
        doing.dataSource = self
        doing.dragDelegate = self
        doing.dropDelegate = self
        doing.dragInteractionEnabled = true
        
        done.delegate = self
        done.dataSource = self
        done.dragDelegate = self
        done.dropDelegate = self
        done.dragInteractionEnabled = true
        
    }
}
extension CardViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CardViewConstant.numberOfRowsInSection
    }
    
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
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        return (view as! UITableViewHeaderFooterView).contentView.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.9607843137, alpha: 1)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CardViewConstant.heightForHeaderInSection
    }
            
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CardCell") as! CardCell
        
        var card : Card
        switch tableView {
        case todo:
            card = board.todoList.items[indexPath.section]
        case doing:
            card = board.doingList.items[indexPath.section]
        case done:
            card = board.doneList.items[indexPath.section]
        default:
            return cell
        }
        cell.title.text = card.title
        cell.content.text = card.content
        cell.writer.text = card.writer
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     
//        editingStyle == .delete
        switch tableView {
        case todo:
            board.remove(at: indexPath.section, type: .todo)
        case doing:
            board.remove(at: indexPath.section, type: .doing)
        case done:
            board.remove(at: indexPath.section, type: .done)
        default:
            return
        }
    }
    
    
}
