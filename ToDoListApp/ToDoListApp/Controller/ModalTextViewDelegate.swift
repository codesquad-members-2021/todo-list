
import Foundation
import UIKit

class ModalTextViewDelegate : NSObject, UITextViewDelegate {
    
    private let contentPlaceHolder = "내용을 입력하세요"
    private var height: ((CGFloat) -> Void)!
    
    func textViewSetUp(_ textView: UITextView) {
        if textView.text == contentPlaceHolder {
            textView.text = ""
            textView.textColor = UIColor.black
        }
        else if textView.text == "" {
            textView.text = contentPlaceHolder
            textView.textColor = UIColor.lightGray
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textViewSetUp(textView)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let string = (textView.text ?? "") as NSString
        let newText = string.replacingCharacters(in: range, with: text)
        
        let limit = 500
        return newText.count <= limit
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textViewSetUp(textView)
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let estimatedSize = textView.sizeThatFits(textView.contentSize)
        self.height(estimatedSize.height)
    }
    
    func configureHeight(closure: @escaping (CGFloat) -> Void) {
        self.height = closure
    }
}
