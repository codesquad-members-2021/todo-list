//  Created by 김지선 on 2021/04/09.
import Foundation

class TaskStack {
    private var taskCards: [TaskCard]
    var count: Int {
        return taskCards.count
    }
    
    init() {
        self.taskCards = []
    }
    
    func index(at index: Int) -> TaskCard {
        return taskCards[index]
    }
    
    func append(taskCard: TaskCard) {
        taskCards.append(taskCard)
    }
    
    func insert(_ taskCard: TaskCard, at index: Int) {
        taskCards.insert(taskCard, at: index)
    }
    
    func remove(at index: Int) -> TaskCard {
        return taskCards.remove(at: index)
    }
}
