//
//  ToDoUseCasePort.swift
//  ToDoListApp
//
//  Created by zombietux on 2021/04/06.
//

import Foundation
import Combine

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
    func get(state: State) -> AnyPublisher<[Card], Error>
}
