//  Created by 김지선 on 2021/04/08.
import UIKit

class TaskViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var taskCountLabel: UILabel!
    
    var status: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
    }
    

}

//MARK: -@Action

extension TaskViewController {
    @IBAction func addTaskCardButtonTouched(_ sender: Any) {
        print(status!) //ButtonTest
    }
}

//MARK: -Setting && Configure
extension TaskViewController {

    private func setupSubViews() {
        setupTitleLabel()
        configureTaskCountLabel()
    }
    
    private func setupTitleLabel() {
        guard let status = status else { return }
        let titles = TitleList.ofStatus
        titleLabel.text = titles[status]
    }
    
    private func configureTaskCountLabel() {
        taskCountLabel.layer.masksToBounds = true
        taskCountLabel.layer.cornerRadius = taskCountLabel.layer.bounds.size.width/2
    }
}
