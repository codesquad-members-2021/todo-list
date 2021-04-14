//
//  TableviewDelegate.swift
//  ToDoListApp
//
//  Created by zombietux on 2021/04/13.
//

import UIKit

class TableViewDelegate: NSObject {
    private var cardViewModel: CardViewModel!
    private var column: Int!
    
    init(cardViewModel: CardViewModel, column: Int) {
        self.cardViewModel = cardViewModel
        self.column = column
    }
    
    private func makeContextMenu(indexPath: IndexPath) -> UIMenu {
        let goToDone = UIAction(title: "완료한 일로 이동", image: .none) { action in
        }
        
        let edit = UIAction(title: "수정하기", image: .none) { action in
            self.gotoInputViewController(indexPath: indexPath)
        }
        
        let delete = UIAction(title: "삭제하기", image: .none, attributes: .destructive) { action in
        }
        
        return UIMenu(title: "", children: [goToDone, edit, delete])
    }
    
    private func gotoInputViewController(indexPath: IndexPath) {
        guard let inputViewController = UIStoryboard(name: "Main", bundle: .none).instantiateViewController(identifier: "InputViewController") as? InputViewController else {
            return
        }
        inputViewController.modalPresentationStyle = .overCurrentContext
        inputViewController.setupMode("edit")
        inputViewController.setupId(self.cardViewModel?.boards[self.column].getBoard().getCards()[indexPath.row].getId() ?? 0)
        let rootViewController = UIApplication.shared.keyWindow?.rootViewController
        rootViewController?.present(inputViewController, animated: false, completion: .none)
    }
}

extension TableViewDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: .none, previewProvider: .none) { suggestedAction -> UIMenu? in
            return self.makeContextMenu(indexPath: indexPath)
        }
    }
}
