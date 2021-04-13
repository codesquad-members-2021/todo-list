
import Foundation

class CardMaker {
    private let author: String
    private var currentState: States!
    
    init() {
        self.author = "author by iOS"
    }
    
    func change(state: States) {
        self.currentState = state
    }
    
    func makeCard(title: String, content: String) -> Card {
        return Card(title: title, body: content, author: author, states: currentState)
    }
}
