//  Created by 김지선 on 2021/04/09.
import Foundation

class TaskStack {
    private var taskCards = [TaskCard]()
    
    func insertTask(_ card: TaskCard) {
        taskCards.append(card)
    }
}
