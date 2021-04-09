//  Created by 김지선 on 2021/04/08.
import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet weak var iOSLabel: UILabel!
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var contextTextLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
