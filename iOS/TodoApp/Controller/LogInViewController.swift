//  Created by 서우석 on 2021/04/16.
import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
    }

    @IBAction func logInButtonTouched(_ sender: Any) {
        NetworkManager.loginPost(id: idTextField.text ?? "", password: passwordTextField.text ?? "")
    }
}
