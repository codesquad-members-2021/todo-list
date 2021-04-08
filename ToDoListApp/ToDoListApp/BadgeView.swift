
import Foundation
import UIKit

class BadgeView : UIView {

    
    @IBOutlet weak var label: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.layer.cornerRadius = 15
    }
}
