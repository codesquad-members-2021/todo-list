//  Created by 김지선 on 2021/04/15.
import UIKit

class EditViewController: UIViewController {
    
    private var editTaskView = EditView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainView()
    }
    
    private func setupMainView() {
        view.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.4)
        view.addSubview(editTaskView)
        editTaskView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        editTaskView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setUpInfo(titleText: String, contentText: String) {
        editTaskView.titleTextField.text = titleText
        editTaskView.contentTextField.text = contentText
    }
}
