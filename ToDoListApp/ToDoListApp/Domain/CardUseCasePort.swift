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
    func getTitle() -> String
    func getContents() -> String
}

protocol CardUseCasePort {
    func add()
    func edit()
    func delete()
    func goToDone()
    func get() -> [BoardManageable]
}
