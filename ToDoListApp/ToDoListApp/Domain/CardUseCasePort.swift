//
//  ToDoUseCasePort.swift
//  ToDoListApp
//
//  Created by zombietux on 2021/04/06.
//

import Foundation

protocol CardManageable {
    func add()
    func edit()
    func delete()
    func goToDone()
}

protocol CardUseCasePort {
    func add()
    func edit()
    func delete()
    func goToDone()
    func get() -> [Board]
}
