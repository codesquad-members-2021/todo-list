//
//  ImportViewModel.swift
//  TODOList
//
//  Created by Issac on 2021/04/08.
//

import Foundation

struct ImportViewModel {
    var subject: TextObservable<String>
    var body: TextObservable<String>
    
    func trigger() {
    }
}
