import UIKit

class TaskCountLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configrueLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configrueLabel()
    }
    
    private func configrueLabel() {
        layer.masksToBounds = true
        layer.cornerRadius = 10
    }
}
