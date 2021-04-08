
import Foundation
import UIKit

class ToDoTableViewDataSource : NSObject, UITableViewDataSource {
    
    var delegate: CardManageDelegate?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return delegate!.count(states: .ToDo)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell") as? CardCell
        else {
            return UITableViewCell()
        }
        
        delegate!.setCell(states: .ToDo, index: indexPath.section) { card in
            cell.title.text = card.title
            cell.contents.text = card.body
            cell.author.text = card.author
        }
        return cell
    }
}
