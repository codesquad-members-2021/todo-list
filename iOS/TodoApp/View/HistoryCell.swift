//  Created by 김지선 on 2021/04/15.
import UIKit

class HistoryCell: UITableViewCell {

    @IBOutlet weak var userInfoLabel: UILabel!
    @IBOutlet weak var historyLogLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
