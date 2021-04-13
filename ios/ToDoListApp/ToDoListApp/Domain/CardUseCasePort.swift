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
    func getId() -> Int?
}

protocol CardUseCasePort {
    func add(columnId: Int, title: String, contents: String) -> AnyPublisher<[Card], Error>
    func edit(id: Int, title: String, contents: String) -> AnyPublisher<[Card], Error>
    func delete()
    func goToDone()
    func get(state: State) -> AnyPublisher<[Card], Error>
}
