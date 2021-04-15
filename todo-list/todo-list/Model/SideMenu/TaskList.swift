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

    var list = [Task(nickname: "에이든", content: "제이슨 파싱 개고생", time: Date()),
                Task(nickname: "에이든2", content: "제이슨 파싱 개고생2", time: Date()),
                Task(nickname: "롤로", content: "ㅎㅎㅎ", time: Date())]
    
    func addTask(task: Task) {
        list.append(task)
    }

}

