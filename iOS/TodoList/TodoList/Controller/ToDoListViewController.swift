import UIKit

class ToDoListViewController: UIViewController {

    @IBOutlet weak var addCardButton: UIButton!
    @IBOutlet weak var todoListView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setUpTaskbutton() {
        addCardButton.addTarget(todoListView, action: #selector(addCardButtonTouched), for: .touchUpInside)
    }
    
    @objc func addCardButtonTouched() {
        // 저는 V 할때까지만 할래요 ㅋㅋㅋㅋㅋ
    }
}

