//
//  WillTODOViewModel.swift
//  TODOList
//
//  Created by Issac on 2021/04/07.
//

import Foundation

class AppearViewModel {
    private(set) var doingStatus: [Status] {
        didSet {
            self.passingData()
        }
    }
    private(set) var completeStatus: [Status] {
        didSet {
            self.passingData()
        }
    }
    private(set) var willStatus: [Status] {
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
        self.doingStatus = [Status]()
        self.completeStatus = [Status]()
        self.willStatus = [Status]()
        
        loadCards.getCards { (dict) in
            switch self.mode {
            case .doingTODO:
                self.doingStatus = dict[self.mode.rawValue, default: [Status]()]
            case .completeTODO:
                self.completeStatus = dict[self.mode.rawValue, default: [Status]()]
            case .willTODO:
                self.willStatus = dict[self.mode.rawValue, default: [Status]()]
            }
        }
    }
    
    private func passingData() {
        switch self.mode {
        case .completeTODO:
            passingDataHandler?(completeStatus)
        case .doingTODO:
            passingDataHandler?(doingStatus)
        case .willTODO:
            passingDataHandler?(willStatus)
        }
    }
}
