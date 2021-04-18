//  Created by 서우석 on 2021/04/16.
import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var logInMainView: UIView!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInImageView: UIImageView!
    @IBOutlet weak var logInImageView2: UIImageView!
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var pwLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        logInMainView.backgroundColor = UIColor(patternImage: UIImage(named: "띵언")!)
        logInMainView.layer.cornerRadius = 5
        passwordTextField.isSecureTextEntry = true
        logInImageView.layer.masksToBounds = true
        logInImageView.layer.cornerRadius = logInImageView.frame.width/3
        logInImageView2.layer.masksToBounds = true
        logInImageView2.layer.cornerRadius = logInImageView2.frame.width/3
        idLabel.layer.masksToBounds = true
        pwLabel.layer.masksToBounds = true
        idLabel.layer.cornerRadius = 5
        pwLabel.layer.cornerRadius = 5
        idTextField.attributedPlaceholder = NSAttributedString(string: "아이디를 입력하세요~", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "비밀번호를 입력하세요~", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        
    }

    @IBAction func logInButtonTouched(_ sender: Any) {
        NetworkManager.loginPost(id: idTextField.text ?? "", password: passwordTextField.text ?? "")
    }
}
