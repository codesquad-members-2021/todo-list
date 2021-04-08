import UIKit

class SignUpMainViewController: UIViewController {
    
    private var mainViewTitle: MainTitleLabel!
    private var mainStackView = MainInfoStackView()
    private var buttonForMove = CustomButton(type: .system)
    private var validateManager: RegexValidManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        validateManager = RegexValidManager()
        setUpMainView()
        enableButton()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    private func setUpMainView() {
        //MainView Background Color
        view.backgroundColor = UIColor.systemGray6
        
        setUpLabelAndTextField()
        
        configureTitle()
        
        configureMainStackView()
        
        configureNextButton()
        
        addTargetForButton()
        
        textEdittingForTextField()
        
    }
    
    private func enableButton() {
        if enableCheckforButtion() {
            buttonForMove.isOn = .on
        } else {
            buttonForMove.isOn = .off
        }
    }
}


//MARK: -configuration && Setup

extension SignUpMainViewController {
    
    private func configureTitle() {
        mainViewTitle = MainTitleLabel(frame: CGRect(x: 0, y: 0, width: 150, height: 40))
        mainViewTitle.layer.position = CGPoint(x: view.bounds.width/2, y: 60)
        mainViewTitle.text = MainTitleContents.main
        view.addSubview(mainViewTitle)
    }
    
    private func configureMainStackView() {
        mainStackView.frame = CGRect(x: 40, y: 120, width: 300, height: 400)
        view.addSubview(mainStackView)
    }
    
    private func configureNextButton() {
        buttonForMove.frame = CGRect(x: 120, y: 600, width: 140, height: 50)
        buttonForMove.setTitle(ButtonTitle.next, for: .normal)
        view.addSubview(buttonForMove)
    }
    
    private func setUpLabelAndTextField() {
        mainStackView.infoIDView.infoLabel.text = MainLabelContents.idLabel
        mainStackView.infoIDView.inputTextField.placeholder = MainLabelContents.idPlaceholder
        mainStackView.infoPasswordView.infoLabel.text = MainLabelContents.passwordLabel
        mainStackView.infoPasswordView.inputTextField.placeholder = MainLabelContents.passwordPlaceHolder
        mainStackView.doubleCheckPassWordView.infoLabel.text = MainLabelContents.passwordDoubleCheckLabel
        mainStackView.nameCheckView.infoLabel.text = MainLabelContents.nameLabel
    }
}

//MARK:: -@objc Action

extension SignUpMainViewController {
    
    @objc func nextMoveButtonTouched(button: UIButton) {
        let toDoListController = storyboard!.instantiateViewController(identifier: "MainViewController")
        toDoListController.modalPresentationStyle = .fullScreen
        present(toDoListController, animated: true, completion: nil)
    }
    
    @objc func textFieldEddtingChanged(textField: UITextField) {
        enableButton()
        let _ = isValidConditionForID() || isValidConditionForPassword() || isValidConditionForPasswordConfirm() || isValidConditionForName()
    }
}

//MARK: -Add Target
extension SignUpMainViewController {
    
    private func addTargetForButton() {
        buttonForMove.addTarget(self, action: #selector(nextMoveButtonTouched(button:)), for: .touchUpInside)
    }

    private func textEdittingForTextField() {
        mainStackView.infoIDView.inputTextField.addTarget(self, action: #selector(textFieldEddtingChanged(textField:)), for: .editingChanged)
        mainStackView.infoPasswordView.inputTextField.addTarget(self, action: #selector(textFieldEddtingChanged(textField:)), for: .editingChanged)
        mainStackView.doubleCheckPassWordView.inputTextField.addTarget(self, action: #selector(textFieldEddtingChanged(textField:)), for: .editingChanged)
        mainStackView.nameCheckView.inputTextField.addTarget(self, action: #selector(textFieldEddtingChanged(textField:)), for: .editingChanged)
    }
}

//MARK: -Regex

extension SignUpMainViewController {
    
    // Button State Check
    private func enableCheckforButtion() -> Bool {
        return isValidConditionForID() && isValidConditionForPassword() && isValidConditionForPasswordConfirm() && isValidConditionForName()
    }
    
    // ID Check
    private func isValidConditionForID() -> Bool {
        let userIdView = mainStackView.infoIDView
        if validateManager.isEmptyTextField(userIdView.inputTextField.text) {
            mainStackView.defaultStateFor(textField: userIdView.inputTextField, label: userIdView.checkLabel)
        } else if !validateManager.isOverlappedID(userIdView.inputTextField.text) {
            mainStackView.overlappedIDFor(checkLabel: userIdView.checkLabel)
            mainStackView.invalidTextFieldBoarder(textField: userIdView.inputTextField)
        } else if !validateManager.isValidElementForID(userIdView.inputTextField.text) {
            mainStackView.invalidElementIDFor(checkLabel: userIdView.checkLabel)
            mainStackView.invalidTextFieldBoarder(textField: userIdView.inputTextField)
        } else if !validateManager.isValidCountForID(userIdView.inputTextField.text) {
            mainStackView.invalidIDCountFor(checkLabel: userIdView.checkLabel)
            mainStackView.invalidTextFieldBoarder(textField: userIdView.inputTextField)
        } else {
            mainStackView.validIdStateFor(checkLabel: userIdView.checkLabel)
            mainStackView.validTextFieldBoarder(textField: userIdView.inputTextField)
            return true
        }
        return false
    }
    
    // Password Check
    private func isValidConditionForPassword() -> Bool {
        let userPasswordView = mainStackView.infoPasswordView
        if validateManager.isEmptyTextField(userPasswordView.inputTextField.text) {
            mainStackView.defaultStateFor(textField: userPasswordView.inputTextField, label: userPasswordView.checkLabel)
        } else if !validateManager.isValidElementForPassword(userPasswordView.inputTextField.text) {
            mainStackView.invalidElementPasswordFor(checkLabel: userPasswordView.checkLabel)
            mainStackView.invalidTextFieldBoarder(textField: userPasswordView.inputTextField)
        } else if !validateManager.isValidCountForPassWord(userPasswordView.inputTextField.text) {
            mainStackView.invalidCountPasswordFor(checkLabel: userPasswordView.checkLabel)
            mainStackView.invalidTextFieldBoarder(textField: userPasswordView.inputTextField)
        } else {
            mainStackView.validPasswordStateFor(checkLabel: userPasswordView.checkLabel)
            mainStackView.validTextFieldBoarder(textField: userPasswordView.inputTextField)
            return true
        }
        return false
    }
    
    // PasswordConfirm Check
    private func isValidConditionForPasswordConfirm() -> Bool {
        let userPasswordConfirmView = mainStackView.doubleCheckPassWordView
        let userPasswordView = mainStackView.infoPasswordView
        if validateManager.isEmptyTextField(userPasswordConfirmView.inputTextField.text) {
            mainStackView.defaultStateFor(textField: userPasswordConfirmView.inputTextField, label: userPasswordConfirmView.checkLabel)
        } else if !validateManager.isEqualForPassword(userPasswordView.inputTextField.text, userPasswordConfirmView.inputTextField.text) {
            mainStackView.incorrectPasswordFor(checkLabel: userPasswordConfirmView.checkLabel)
            mainStackView.invalidTextFieldBoarder(textField: userPasswordConfirmView.inputTextField)
        } else {
            mainStackView.correctPasswordFor(checkLabel: userPasswordConfirmView.checkLabel)
            mainStackView.validTextFieldBoarder(textField: userPasswordConfirmView.inputTextField)
            return true
        }
        return false
    }
    
    // Name Check
    private func isValidConditionForName() -> Bool {
        let userNameView = mainStackView.nameCheckView
        if validateManager.isEmptyTextField(userNameView.inputTextField.text) {
            mainStackView.defaultStateFor(textField: userNameView.inputTextField, label: userNameView.checkLabel)
        } else if !validateManager.isValidNameCount(userNameView.inputTextField.text) {
            mainStackView.invalidNameCountFor(checkLabel: userNameView.checkLabel)
            mainStackView.invalidTextFieldBoarder(textField: userNameView.inputTextField)
        } else {
            mainStackView.validNameStateFor(checkLabel: userNameView.checkLabel)
            mainStackView.validTextFieldBoarder(textField: userNameView.inputTextField)
            return true
        }
        return false
    }
}
