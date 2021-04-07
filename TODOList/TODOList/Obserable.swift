//
//  Obserable.swift
//  TODOList
//
//  Created by Issac on 2021/04/07.
//

import Foundation

class TextObservable<ObservedType> {
    private var _value: ObservedType?
    var changeClosure: ((ObservedType?) -> ())?
    init(value: ObservedType) {
        _value = value
    }
    public var value: ObservedType? {
        get {
            return _value
        }
        set {
            _value = newValue
            changeClosure?(_value)
        }
    }
    
    func changeValue(to value: ObservedType) {
        _value = value
        print("change value", value)
    }
}
