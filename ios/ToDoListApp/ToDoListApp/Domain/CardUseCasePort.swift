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
    func getTitle() -> String
    func getContents() -> String
}

protocol CardUseCasePort {
    func add(title: String, contents: String) -> AnyPublisher<[Card], Error>
    func edit()
    func delete()
    func goToDone()
    func get(state: State) -> AnyPublisher<[Card], Error>
}
