//
//  ModalView.swift
//  ToDoListApp
//
//  Created by 박정하 on 2021/04/10.
//

import UIKit

class ModalViewController : UIViewController {
    @IBOutlet weak private var addButton: UIButton!
    @IBOutlet weak private var CancelButton: UIButton!
    @IBOutlet weak private var titleTextField: UITextField!
    @IBOutlet weak private var contentTextField: UITextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addCard(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("addCard"), object: self)
    }
    
    @IBAction func inActiveNewCardForm(_ sender: Any) {
        set(active: false)
    }
    
    func set(active : Bool){
        self.dismiss(animated: active, completion: nil)
    }
    
    func makeCellData() -> CellData{
        guard let titlefieldText = titleTextField.text,
              let contentFieldText = contentTextField.text
        else { return CellData.init(title: "", content: "") }
        
        let cellData : CellData = CellData.init(title: titlefieldText, content: contentFieldText)
        return cellData
    }
}
