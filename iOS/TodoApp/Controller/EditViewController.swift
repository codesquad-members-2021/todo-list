//  Created by 김지선 on 2021/04/15.
import UIKit

class EditViewController: UIViewController {
    
    private var taskStatus: Int!
    private var taskIndex: Int!
    private var editTaskView = EditView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainView()
        setupButton()
    }
    
    private func setupMainView() {
        view.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.4)
        view.addSubview(editTaskView)
        editTaskView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        editTaskView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        editTaskView.layer.cornerRadius = 10
    }
    
    func setUpInfo(status: Int, index: Int, titleText: String, contentText: String) {
        taskStatus = status
        taskIndex = index
        editTaskView.titleTextField.text = titleText
        editTaskView.contentTextField.text = contentText
    }
    
    private func setupButton() {
        editTaskView.cancellButton.addTarget(self, action: #selector(cancelButtonTouched), for: .touchUpInside)
        editTaskView.registerButton.addTarget(self, action: #selector(registerButtonTouched), for: .touchUpInside)
    }
    
    @objc func cancelButtonTouched() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func registerButtonTouched() {
        NotificationCenter.default.post(name: .editTask, object: self, userInfo: ["status": taskStatus, "index": taskIndex, "title": editTaskView.titleTextField.text, "content": editTaskView.contentTextField.text])
        self.dismiss(animated: true, completion: nil)
    }
}
