//
//  ToDoUseCasePort.swift
//  ToDoListApp
//
//  Created by zombietux on 2021/04/06.
//

import Foundation
import Combine

protocol CardManageable {
    func getTitle() -> String
    func getContents() -> String
    func getId() -> Int?
}

protocol CardUseCasePort {
    func add(title: String, contents: String) -> AnyPublisher<[Card], Error>
    func edit()
    func get(state: State) -> AnyPublisher<[Card], Error>
}
