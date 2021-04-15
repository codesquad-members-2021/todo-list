//  Created by 김지선 on 2021/04/15.
import Foundation

class HistoryStack {
    
    private var historyStack = [HistoryCard]()
    
    var count : Int {
        return historyStack.count
    }
    
    func append(historyCard: HistoryCard) {
        historyStack.append(historyCard)
    }
    
    func index(at index: Int) -> HistoryCard {
        return historyStack[index]
    }
}
