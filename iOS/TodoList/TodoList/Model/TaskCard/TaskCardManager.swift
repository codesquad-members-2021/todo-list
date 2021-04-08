import Foundation

class TaskCardManager {
                        
    var cardDeck : [TaskCard] {
        didSet {
            NotificationCenter.default.post(name: .cardChanged, object: self)
        }
    }
    
    init(cards: [TaskCard]) {
        cardDeck = cards
        NotificationCenter.default.addObserver(self, selector: #selector(getCardStatus(_:)), name: .addTaskCard, object: nil)
    }
    
    @objc private func getCardStatus(_ notification: Notification) {
        notification.userInfo?
    }
}
