import UIKit

class MainInfoStackView: UIStackView {
    
    var infoIDView = EachInfoView()
    var infoPasswordView = EachInfoView()
    var doubleCheckPassWordView = EachInfoView()
    var nameCheckView = EachInfoView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpMainStackView()
        setUpSubViews()
    }
    
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setUpMainStackView()
        setUpSubViews()
    }
    
    private func setUpMainStackView() {
        axis = .vertical
        spacing = 10
    }
    
    private func setUpSubViews() {
        self.addArrangedSubview(infoIDView)
        self.addArrangedSubview(infoPasswordView)
        self.addArrangedSubview(doubleCheckPassWordView)
        self.addArrangedSubview(nameCheckView)
        infoPasswordView.inputTextField.isSecureTextEntry = true
        doubleCheckPassWordView.inputTextField.isSecureTextEntry = true
    }
}

//MARK: -ChangeView with Conditions
extension MainInfoStackView {
    
    // Common Method
    func defaultStateFor(textField: UITextField, label: UILabel) {
        textField.layer.borderWidth = 0
        label.text = ""
    }
    
    func invalidTextFieldBoarder(textField: UITextField) {
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.red.cgColor
    }
    
    func validTextFieldBoarder(textField: UITextField) {
        textField.layer.borderWidth = 0
    }
    
    // ID Method
    func invalidIDCountFor(checkLabel: UILabel) {
        checkLabel.textColor = UIColor.systemRed
        checkLabel.text = IdCheck.idCount
    }
    
    func overlappedIDFor(checkLabel: UILabel) {
        checkLabel.textColor = UIColor.systemRed
        checkLabel.text = IdCheck.doubleCheck
    }
    
    func invalidElementIDFor(checkLabel: UILabel) {
        checkLabel.textColor = UIColor.systemRed
        checkLabel.text = IdCheck.nonSupportedValue
    }
    
    func validIdStateFor(checkLabel: UILabel) {
        checkLabel.textColor = UIColor.systemGreen
        checkLabel.text = IdCheck.valid
    }
    
    // Password Method
    func invalidElementPasswordFor(checkLabel: UILabel) {
        checkLabel.textColor = UIColor.systemRed
        checkLabel.text = PasswordCheck.notContainedSpecialCharacters
    }
    
    func invalidCountPasswordFor(checkLabel: UILabel) {
        checkLabel.textColor = UIColor.systemRed
        checkLabel.text = PasswordCheck.passwordCount
    }
    
    func validPasswordStateFor(checkLabel: UILabel) {
        checkLabel.textColor = UIColor.systemGreen
        checkLabel.text = PasswordCheck.valid
    }
    
    // PasswordConfirm Method
    func incorrectPasswordFor(checkLabel: UILabel) {
        checkLabel.textColor = UIColor.systemRed
        checkLabel.text = PasswordConfirmCheck.notEqul
    }
    
    func correctPasswordFor(checkLabel: UILabel) {
        checkLabel.textColor = UIColor.systemGreen
        checkLabel.text = PasswordConfirmCheck.valid
    }
    
    // Name Method
    
    func invalidNameCountFor(checkLabel: UILabel) {
        checkLabel.textColor = UIColor.systemRed
        checkLabel.text = NameCheck.nameCount
    }
    
    func validNameStateFor(checkLabel: UILabel) {
        checkLabel.textColor = UIColor.systemGreen
        checkLabel.text = NameCheck.valid
    }
}
