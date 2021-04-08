//
//  WillTODOViewModel.swift
//  TODOList
//
//  Created by Issac on 2021/04/07.
//

import Foundation

class ExportViewModel {
    var value: TextObservable<[String]>
    
    init() {
        self.value = TextObservable(value: ["안녕하세요"])
    }
}
