//
//  ObservingTextField.swift
//  TODOList
//
//  Created by Issac on 2021/04/08.
//

import UIKit

class ObservingTextField: UITextField {
    var changeClosure: (() -> ())?
    
    @objc func valueChanged() {
        changeClosure?()
    }
    
    func bind(to observable: Observable<String>) {
        self.addTarget(self, action: #selector(valueChanged), for: .editingDidEnd)
        
        changeClosure = { [weak self] in
            observable.changeValue(to: self?.text ?? "")
        }
        
        observable.changeClosure = { [weak self] value in
            self?.text = value ?? ""
        }
    }
}
