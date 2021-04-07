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
        backgroundColor = UIColor.systemGray4
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: 26).isActive = true
        heightAnchor.constraint(equalToConstant: 26).isActive = true
        textAlignment = .center
        layer.masksToBounds = true
        layer.cornerRadius = layer.bounds.size.width/2
    }
}
