//
//  ImportViewModel.swift
//  TODOList
//
//  Created by Issac on 2021/04/08.
//

import Foundation

class ChangeCardViewModel {
    private(set) var subject: Observable<String>
    private(set) var body: Observable<String>
    
    init(subject: String, body: String) {
        self.subject = Observable(value: subject)
        self.body = Observable(value: body)
    }
    
    convenience init() {
        self.init(subject: "", body: "")
    }
    
    func trigger() {
        //usecase 쓰이는 곳
    }
    
    func delete(status: Status) {
        //delete
    }
    
}
