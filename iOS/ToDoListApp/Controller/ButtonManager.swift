
import Foundation

class ButtonManager {
    private var titleText: Bool
    private var contentText: Bool
    
    init() {
        self.titleText = false
        self.contentText = false
    }
    
    func change(title: String) {
        self.titleText = (title != "") ? true : false
        NotificationCenter.default.post(name: ButtonManager.changeState, object: self,
                                        userInfo: [ButtonState.isEnable:isTextFull()])
    }
    
    func change(content: String) {
        self.contentText = (content != "") ? true : false
        NotificationCenter.default.post(name: ButtonManager.changeState, object: self,
                                        userInfo: [ButtonState.isEnable:isTextFull()])
    }
    
    func isTextFull() -> Bool {
        return titleText && contentText
    }
}

extension ButtonManager {
    static let changeState = Notification.Name("changeState")
    
    enum ButtonState {
        case isEnable
    }
}
