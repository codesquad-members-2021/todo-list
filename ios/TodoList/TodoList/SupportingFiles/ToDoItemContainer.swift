
import Foundation

protocol ToDoItemContainer {
    var list: [ToDoItem] {get set}
    func moveItem(at sourceIndex: Int, to destinationIndex: Int)
}
