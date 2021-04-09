//
//  Mode.swift
//  TODOList
//
//  Created by Issac on 2021/04/09.
//

import Foundation

enum Mode {
    case willTODO
    case doingTODO
    case completeTODO
    
    var sectionTitle: String {
        switch self {
        case .willTODO: return "해야할 일"
        case .doingTODO: return "하고있는 일"
        case .completeTODO: return "완료한 일"
        }
    }
}
