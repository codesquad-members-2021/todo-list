//
//  Mode.swift
//  TODOList
//
//  Created by Issac on 2021/04/09.
//

import Foundation

enum SectionMode: Int {
    case willTODO = 0
    case doingTODO = 1
    case completeTODO = 2
    
    var sectionTitle: String {
        switch self {
        case .willTODO: return "해야할 일"
        case .doingTODO: return "하고있는 일"
        case .completeTODO: return "완료한 일"
        }
    }
}
