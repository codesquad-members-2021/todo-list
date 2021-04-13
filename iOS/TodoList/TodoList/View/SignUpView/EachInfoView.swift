import UIKit

class EachInfoView: UIView {
    
    var infoLabel = UILabel()
    var inputTextField = UITextField()
    var checkLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpSubViews()
    }
    
    private func setUpSubViews() {
        setUpInfoLabel()
        setUpTextField()
        setUpCheckLabel()
        configrueSelfView()
    }
    
    private func configrueSelfView() {
        let height = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        addConstraint(height)
    }
    
    private func setUpInfoLabel() {
        infoLabel.textAlignment = .left
        infoLabel.textColor = UIColor.black
        infoLabel.font = UIFont.boldSystemFont(ofSize: 20)
        infoLabel.frame = CGRect(x: 0, y: 0, width: 140, height: 40)
        addSubview(infoLabel)
    }
    
    private func setUpTextField() {
        inputTextField.textAlignment = .left
        inputTextField.textColor = UIColor.systemGray2
        inputTextField.backgroundColor = UIColor.white
        inputTextField.font = UIFont.systemFont(ofSize: 12)
        inputTextField.frame = CGRect(x: 0, y: 40, width: 300, height: 40)
        addSubview(inputTextField)
    }
    private func setUpCheckLabel() {
        checkLabel.textAlignment = .left
        checkLabel.textColor = UIColor.black
        checkLabel.font = UIFont.boldSystemFont(ofSize: 10)
        checkLabel.frame = CGRect(x: 0, y: 80, width: 300, height: 10)
        addSubview(checkLabel)
    }
}
