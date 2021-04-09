//  Created by 김지선 on 2021/04/09.
import UIKit

class NewTaskViewController: UIViewController {
    
    var id: Int?
    
    @IBOutlet weak var newTaskView: UIView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        print(id!)
    }
    
    private func setupView() {
        newTaskView.layer.cornerRadius = 5
        cancelButton.layer.cornerRadius = 5
        registerButton.layer.cornerRadius = 5
    }
    
    private func addTaskCard() {
        NotificationCenter.default.post(name: .addTask, object: self, userInfo: ["title": titleTextField.text ?? "", "content": contentTextField.text ?? "", "id": self.id ?? 0])
    }
}

//MARK: -@Action
extension NewTaskViewController {
    @IBAction func cancelButtonTouched(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func registerButtonTouched(_ sender: Any) {
        addTaskCard()
        dismiss(animated: true, completion: nil)
    }
    
}

//MARK: -Notification.Name
extension Notification.Name {
    static let addTask = Notification.Name("addTask")
}


/*
 V한테 설명할거
 1. TaskViewController => NewTaskViewController (Prepare로 id넘김)
 2. TaskStackManager 생성 및 add Method 구현
 3. RegisterButtonTouched => Notification
 */
