//  Created by 서우석 on 2021/04/16.
import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInImageView: UIImageView!
    @IBOutlet weak var logInImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
        logInImageView.layer.masksToBounds = true
        logInImageView.layer.cornerRadius = logInImageView.frame.width/3
        logInImageView2.layer.masksToBounds = true
        logInImageView2.layer.cornerRadius = logInImageView2.frame.width/3
    }

    @IBAction func logInButtonTouched(_ sender: Any) {
        NetworkManager.loginPost(id: idTextField.text ?? "", password: passwordTextField.text ?? "")
    }
}
