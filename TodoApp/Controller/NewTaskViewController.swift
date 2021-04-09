//  Created by 김지선 on 2021/04/09.
import UIKit

class NewTaskViewController: UIViewController {
    
    @IBOutlet weak var newTaskView: UIView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        newTaskView.layer.cornerRadius = 5
        cancelButton.layer.cornerRadius = 5
        registerButton.layer.cornerRadius = 5
    }
}

extension NewTaskViewController {
    @IBAction func cancelButtonTouched(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func registerButtonTouched(_ sender: Any) {
        // 노티 vs responder chain
    }
    
}
