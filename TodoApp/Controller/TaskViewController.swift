//  Created by 김지선 on 2021/04/08.
import UIKit

class TaskViewController: UIViewController {
    
    var status: Int?
    @IBOutlet weak var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitleLabel()
    }
    
    
    private func setupTitleLabel() {
        guard let status = status else { return }
        let titles = TitleList.ofStatus
        titleLabel.text = titles[status]
    }
}
