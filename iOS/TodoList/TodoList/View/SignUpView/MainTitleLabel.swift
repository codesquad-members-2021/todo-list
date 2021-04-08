import Foundation
import UIKit

class MainTitleLabel: UILabel {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSelfLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureSelfLabel()
    }
    
    private func configureSelfLabel() {
        font = UIFont.boldSystemFont(ofSize: 40)
        textAlignment = .center
        textColor = UIColor.systemGreen
    }
}
