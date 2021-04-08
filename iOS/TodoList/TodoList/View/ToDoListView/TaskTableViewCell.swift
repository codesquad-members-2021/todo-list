//  Created by 김지선 on 2021/04/07.
import UIKit

class TaskTableViewCell: UITableViewCell {
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var contentTextLabel: UILabel!
    @IBOutlet weak var userInfoLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
