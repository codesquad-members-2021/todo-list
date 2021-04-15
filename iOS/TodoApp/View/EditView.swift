//  Created by 김지선 on 2021/04/15.
import UIKit

class EditView: UIView {
    
    private var infoStackView = UIStackView()
    private var editLabel = UILabel()
    var titleTextField = UITextField()
    var contentTextField = UITextField()
    private(set) var cancellButton = UIButton(type: .system)
    private(set) var registerButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupMainView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupMainView()
    }
    
    private func setupMainView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.white
        widthAnchor.constraint(equalToConstant: 400).isActive = true
        heightAnchor.constraint(equalToConstant: 200).isActive = true
        setupSubView()
    }
    
    private func setupSubView() {
        configureLabel()
        configrueStackView()
        configureTextField()
        configrueButton()
    }
}

//MARK: -Configuration
extension EditView {
    
    private func configureLabel() {
        addSubview(editLabel)
        editLabel.text = "Edit Task"
        editLabel.font = UIFont.boldSystemFont(ofSize: 20)
        editLabel.translatesAutoresizingMaskIntoConstraints = false
        editLabel.widthAnchor.constraint(equalToConstant: 368).isActive = true
        editLabel.heightAnchor.constraint(equalToConstant: 23).isActive = true
        editLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        editLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
    }
    
    private func configrueStackView() {
        addSubview(infoStackView)
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        infoStackView.spacing = 4
        infoStackView.axis = .vertical
        infoStackView.widthAnchor.constraint(equalToConstant: 368).isActive = true
        infoStackView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        infoStackView.topAnchor.constraint(equalTo: topAnchor, constant: 55).isActive = true
        infoStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
    }
    
    private func configureTextField() {
        let titleWidth = NSLayoutConstraint(item: titleTextField, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 368)
        let titleHeight = NSLayoutConstraint(item: titleTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 20)
        let contentWidth = NSLayoutConstraint(item: contentTextField, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 368)
        let contentHeight = NSLayoutConstraint(item: contentTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        titleTextField.addConstraints([titleWidth, titleHeight])
        contentTextField.addConstraints([contentWidth, contentHeight])
        infoStackView.addArrangedSubview(titleTextField)
        infoStackView.addArrangedSubview(contentTextField)
    }
    
    private func configrueButton() {
        cancellButton.setTitle("Cancel", for: .normal)
        cancellButton.tintColor = UIColor.systemGray
        cancellButton.backgroundColor = UIColor.systemGray5
        cancellButton.frame = CGRect(x: 160, y: 139, width: 100, height: 40)
        cancellButton.layer.masksToBounds = true
        cancellButton.layer.cornerRadius = 5
        addSubview(cancellButton)

        registerButton.setTitle("Register", for: .normal)
        registerButton.tintColor = UIColor.white
        registerButton.backgroundColor = UIColor.systemBlue
        registerButton.frame = CGRect(x: 276, y: 139, width: 100, height: 40)
        registerButton.layer.masksToBounds = true
        registerButton.layer.cornerRadius = 5
        addSubview(registerButton)
    }
}
