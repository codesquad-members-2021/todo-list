
import UIKit

protocol CardDelegate {
    func cardData(_ card: Card)
}


class ModalViewController: UIViewController {

    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var updateButton: UIButton!
    
    @IBOutlet weak var backgroundViewHeigthConstraint: NSLayoutConstraint!
    
    private var contentTextViewDelegate = ModalTextViewDelegate()
    private var titleTextFieldDelegate = ModalTextFieldDelegate()
    private var buttonManager = ButtonManager()
    private var sizeManager = SizeManager()
    private var cardMaker = CardMaker()
    
    private var cardDelegate: CardDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(changeSize), name: SizeManager.changeSize, object: sizeManager)
        NotificationCenter.default.addObserver(self, selector: #selector(changeButtonState), name: ButtonManager.changeState, object: buttonManager)
        
        setUpView()
        setUpButton()
        setUpDelegate()
        setUpViewSize()
    }
    
    func setUpView() {
        let cornerRadius: CGFloat = 5
        self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        self.backgroundView.layer.cornerRadius = cornerRadius
        
    }

    func setUpButton() {
        let cornerRadius: CGFloat = 5
        self.cancelButton.layer.cornerRadius = cornerRadius
        self.updateButton.layer.cornerRadius = cornerRadius
    }
    
    func setUpDelegate() {
        self.titleTextField.delegate = titleTextFieldDelegate
        self.contentTextView.delegate = contentTextViewDelegate
        
        self.titleTextFieldDelegate.changeText { text in
            self.buttonManager.change(title: text)
        }
        
        self.contentTextViewDelegate.changeText { text in
            self.buttonManager.change(content: text)
        }
    }
    
    func setUpViewSize() {
        let contentTextViewHeight = contentTextView.sizeThatFits(contentTextView.contentSize).height
        self.sizeManager.setInitialHeight(viewHeight: backgroundViewHeigthConstraint.constant, contentTextViewHeight: contentTextViewHeight)
        
        self.contentTextViewDelegate.configureHeight { height in
            self.sizeManager.changeHeight(height)
        }
    }
    
    func setUpCardDelegate(state: States, delegate: CardDelegate) {
        self.cardMaker.change(state: state)
        self.cardDelegate = delegate
    }
    
    //MARK: IBAction 처리
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func updateButtonPressed(_ sender: UIButton) {
        guard let title = titleTextField.text, let content = contentTextView.text
        else {
            return
        }
        
        let card = cardMaker.makeCard(title: title, content: content)
        self.cardDelegate.cardData(card)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: objc 처리
    @objc func changeSize(notification: Notification) {
        guard let backgroundViewHeight = notification.userInfo?[SizeManager.Size.backgroundViewHeight] as? CGFloat
        else {
            return
        }
        
        self.backgroundViewHeigthConstraint.constant = backgroundViewHeight
    }
    
    @objc func changeButtonState(notification: Notification) {
        guard let state = notification.userInfo?[ButtonManager.ButtonState.isEnable] as? Bool, state == true
        else {
            return
        }
        self.updateButton.backgroundColor = UIColor.systemBlue
        self.updateButton.isEnabled = state
    }
}
