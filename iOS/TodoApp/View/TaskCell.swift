//  Created by 김지선 on 2021/04/08.
import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet weak var taskCellView: UIView!
    @IBOutlet weak var iOSLabel: UILabel!
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var contentTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setup()
    }
    
    private func setup() {
        taskCellView.layer.masksToBounds = true
        taskCellView.layer.cornerRadius = 10
    }
    
    func configure(with taskCard: TaskCard){
        titleTextLabel.text = taskCard.title
        contentTextLabel.text = taskCard.content
        iOSLabel.text = taskCard.author
    }
}
