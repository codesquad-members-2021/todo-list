//
//  TaskList.swift
//  todo-list
//
//  Created by Song on 2021/04/14.
//

import Foundation

struct Task {
    let nickname: String
    let content: String
    let time: Date
}

class TaskManager {

    private var list = [Task]()
    private let nicknames = ["@Aiden", "@Cooper", "@Lollo", "@MJ"]
    
    enum Style: String {
        case new = "추가"
        case edit = "수정"
        case move = "이동"
        case delete = "삭제"
    }
    
    func addMoveTask(fromCategory: String, toCategory: String, cardTitle: String) {
        let taskStyle = Style.move.rawValue
        let content = "%\(cardTitle)%을(를) %\(fromCategory)%에서 %\(toCategory)%로 %\(taskStyle)%했습니다."
        let task = makeTask(of: content)
        list.append(task)
    }
    
    func addTask(category: String, cardTitle: String, taskStyle: Style) {
        let preposition = taskStyle == Style.new ? "에" : "의"
        let content = "%\(category)%\(preposition) %\(cardTitle)%을(를) %\(taskStyle.rawValue)%했습니다."
        let task = makeTask(of: content)
        list.append(task)
    }
    
    private func makeTask(of content: String) -> Task {
        let nickname = nicknames[count() % 4]
        let time = Date()
        let task = Task(nickname: nickname, content: content, time: time)
        return task
    }
}

extension TaskManager: TaskFinddable {
    
    func count() -> Int {
        return list.count
    }
    
    func taskAt(index: Int) -> Task {
        return list[index]
    }
    
}

