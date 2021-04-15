
import Foundation
import UIKit

class SizeManager {
    private var contentBasicHeight: CGFloat
    private var backgroundViewHeight: CGFloat
    private var changedHeight: CGFloat
    
    init() {
        self.contentBasicHeight = 0
        self.backgroundViewHeight = 0
        self.changedHeight = 0
    }
    
    func setInitialHeight(viewHeight: CGFloat, contentTextViewHeight: CGFloat) {
        self.backgroundViewHeight = viewHeight
        self.contentBasicHeight = contentTextViewHeight
    }
    
    func changed (_ height: CGFloat) {
        if self.changedHeight != height {
            changeHeight(height)
        }
    }
    
    func changeHeight(_ height: CGFloat) {
        let offset = height - contentBasicHeight
        self.contentBasicHeight += offset
        self.backgroundViewHeight += offset
        
        var userInfo : [AnyHashable:Any] = [:]
        userInfo.updateValue(self.backgroundViewHeight, forKey: Size.backgroundViewHeight)
        NotificationCenter.default.post(name: SizeManager.changeSize, object: self, userInfo: userInfo)
    }
}

extension SizeManager {
    static let changeSize = Notification.Name("changeSize")
    
    enum Size {
        case backgroundViewHeight
    }
}
