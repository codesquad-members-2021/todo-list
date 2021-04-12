
import Foundation
import UIKit

class ModalTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    private var text: ((String) -> Void)!
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let tempText = (textField.text ?? "") as NSString
        let newText = tempText.replacingCharacters(in: range, with: string)
        self.text(newText)
        return true
    }
    
    func changeText(closure: @escaping (String) -> Void) {
        self.text = closure
    }
}
