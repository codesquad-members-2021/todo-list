//
//  WillTODOViewModel.swift
//  TODOList
//
//  Created by Issac on 2021/04/07.
//

import Foundation

//MARK:이 부분을 협의해봐야 한다.
struct Status {
    var subject: [String]
    var body: [String]
}

class AppearViewModel {
    private(set) var doingStatus: Status {
        didSet {
            //변화가 생기면 trigger
        }
    }
    private(set) var completeStatus: Status
    private(set) var willStatus: Status
    private var mode: Mode //받아올때 잘 판별하기
    var passingDataHandler: ((Status) -> ())?
    
    init(mode: Mode) {
        self.doingStatus = Status(subject: ["두잉"], body: ["입니다"])
        self.completeStatus = Status(subject: ["컴플리트"], body: ["입니다"])
        self.willStatus = Status(subject: ["윌"], body: ["입니다"])
        self.mode = mode
        
        //output test
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            self.passingData()
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
