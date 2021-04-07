//
//  TodoDataSource.swift
//  Todo_List
//
//  Created by 심영민 on 2021/04/06.
//

import UIKit

class TodoDataSource: NSObject, UITableViewDataSource {
    private var todoCards: [TodoCard] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5//todoCards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodoCell.identifier, for: indexPath) as? TodoCell else { return UITableViewCell() }
        cell.titleLabel.text = titleEX
        cell.contentLabel.text = contentEX
        cell.contentLabel.addLineSpacing()
        
        return cell
    }
}

let titleEX = "GitHub 공부하기"
let contentEX = """
            add, commit, push
            * GitHub 공부 내용
            * 모던 스위프트 공부 내용 1장
            - JK 의 앵프라맹스
            """
