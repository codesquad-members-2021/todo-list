//  Created by 김지선 on 2021/04/07.


import UIKit

class TaskViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNotification()
    }
    
    @IBAction func addTaskButton(_ sender: Any) {
    }
    
    private func setUpNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(getTextInfo), name: .addTextFieldText, object: nil)
    }
}

extension TaskViewController {
    
    @objc private func getTextInfo(_ notification: Notification) {
        let titleText = notification.userInfo?["title"]
        let contentText = notification.userInfo?["content"]
        print(titleText, contentText)
    }
}
