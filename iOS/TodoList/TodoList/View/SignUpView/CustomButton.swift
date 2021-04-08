import UIKit

class CustomButton: UIButton {
    
    enum buttonState {
        case on
        case off
    }
    
    var isOn: buttonState = .off {
        didSet {
            enableButton()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureButton()
    }
    
    private func configureButton() {
        setTitleColor(.systemGray, for: .normal)
        backgroundColor = UIColor.white
    }
    
    private func enableButton() {
        switch isOn {
        case .off:
            setTitleColor(.systemGray, for: .normal)
            isEnabled = false
        case .on:
            setTitleColor(.systemGreen, for: .normal)
            isEnabled = true
        }
    }
}
