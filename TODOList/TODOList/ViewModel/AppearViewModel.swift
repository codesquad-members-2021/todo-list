//
//  WillTODOViewModel.swift
//  TODOList
//
//  Created by Issac on 2021/04/07.
//

import Foundation

class AppearViewModel {
    private(set) var status: [Status] {
        didSet {
            self.passingData()
        }
    }
    private var mode: Mode
    var passingDataHandler: (([Status]) -> ())?
    var loadCards: LoadCards
    
    init(mode: Mode) {
        self.mode = mode
        self.loadCards = LoadCards()
        self.status = [Status]()
        
        loadCards.getCards { (dict) in
            switch self.mode {
            case .doingTODO:
                self.status = dict[self.mode.rawValue, default: [Status]()]
            case .completeTODO:
                self.status = dict[self.mode.rawValue, default: [Status]()]
            case .willTODO:
                self.status = dict[self.mode.rawValue, default: [Status]()]
            }
        }
    }
    
    private func passingData() {
        switch self.mode {
        case .completeTODO:
            passingDataHandler?(status)
        case .doingTODO:
            passingDataHandler?(status)
        case .willTODO:
            passingDataHandler?(status)
        }
    }
}
